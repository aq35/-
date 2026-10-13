#!/usr/bin/env bash
# hotfix/* ブランチの全コミットが「main にマージ済みのコミットを、そのまま cherry-pick -x したもの」か検査する。
# → hotfix に未レビューのコードが入らないこと、修正が main に戻し忘れられないことを保証する。
#
# 重要: このスクリプトは必ず main 側のものを実行する（hotfix ブランチ側のものは改ざんできるため）。
#   git show origin/main:scripts/check-hotfix.sh | bash -s -- <base-ref>
#
# 使い方: check-hotfix.sh <base-ref>
#   base-ref: hotfix を切った本番タグ（例: prod-20261013-101500）
# 環境変数:
#   GIT_REMOTE: main を取得するリモート（既定: origin）
#
# 判定:
#   OK   … 元コミットが main にあり、変更内容（前後の文脈を除いた差分）が元コミットと同一
#   WARN … 衝突を解決したため内容が異なるが、コミットに "Conflict-Resolved: <説明>" がある
#          → 差分の違いをログに出す。本番承認者がこれを確認してから承認する
#   NG   … -x の記録がない / 元コミットが main にない / 内容が異なるのに説明がない / マージコミット
set -euo pipefail

base=${1:?usage: check-hotfix.sh <base-ref>}
remote=${GIT_REMOTE:-origin}

git fetch -q "$remote" +refs/heads/main:refs/remotes/origin/main
git rev-parse -q --verify "$base^{commit}" >/dev/null \
  || git fetch -q "$remote" "+refs/tags/$base:refs/tags/$base"

# 前後の文脈を除いた差分の指紋（文脈が違うだけのきれいな cherry-pick は同じ値になる）
changes_id() { git diff-tree -p -U0 "$1" | git patch-id --stable | cut -d' ' -f1; }

fail=0
for c in $(git rev-list --no-merges --reverse "$base..HEAD"); do
  subject=$(git log -1 --format='%h %s' "$c")
  msg=$(git log -1 --format=%B "$c")
  src=$(sed -n 's/^(cherry picked from commit \([0-9a-f]\{7,40\}\))$/\1/p' <<<"$msg" | tail -1)

  if [[ -z $src ]]; then
    echo "NG    $subject  … cherry-pick -x の記録がありません"
    fail=1
  elif ! git merge-base --is-ancestor "$src" origin/main 2>/dev/null; then
    echo "NG    $subject  … 元コミット $src が main にありません（先に main へマージしてください）"
    fail=1
  elif [[ $(changes_id "$c") == "$(changes_id "$src")" ]]; then
    echo "OK    $subject  ← $src"
  elif grep -q '^Conflict-Resolved: .' <<<"$msg"; then
    echo "WARN  $subject  ← $src  … 衝突解決により内容が異なります（本番承認者は以下を確認）"
    echo "      $(grep '^Conflict-Resolved: ' <<<"$msg")"
    diff <(git diff-tree -p -U0 "$src" | grep '^[+-]') <(git diff-tree -p -U0 "$c" | grep '^[+-]') \
      | sed 's/^/      /' || true
  else
    echo "NG    $subject  ← $src  … 内容が元コミットと異なります"
    echo "      衝突を解決した場合は、コミットメッセージに 'Conflict-Resolved: <何をどう解決したか>' を追記してください"
    fail=1
  fi
done

if git rev-list --merges "$base..HEAD" | grep -q .; then
  echo "NG    hotfix にマージコミットがあります（cherry-pick のみ許可）"
  fail=1
fi

exit $fail
