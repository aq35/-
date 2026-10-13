#!/usr/bin/env bash
# hotfix/* ブランチの全コミットが「main にマージ済みのコミットを cherry-pick -x したもの」か検査する。
# → hotfix に未レビューのコードが入らないこと、修正が main に戻し忘れられないことを保証する。
#
# 使い方: check-hotfix.sh <base-ref>
#   base-ref: hotfix を切った本番タグ（例: prod-20261013-101500）
# 環境変数:
#   GIT_REMOTE: main を取得するリモート（既定: origin）
set -euo pipefail

base=${1:?usage: check-hotfix.sh <base-ref>}
remote=${GIT_REMOTE:-origin}

git fetch -q "$remote" +refs/heads/main:refs/remotes/origin/main
git rev-parse -q --verify "$base^{commit}" >/dev/null \
  || git fetch -q "$remote" "+refs/tags/$base:refs/tags/$base"

fail=0
for c in $(git rev-list --no-merges --reverse "$base..HEAD"); do
  subject=$(git log -1 --format='%h %s' "$c")
  src=$(git log -1 --format=%B "$c" \
    | sed -n 's/^(cherry picked from commit \([0-9a-f]\{7,40\}\))$/\1/p' | tail -1)

  if [[ -z $src ]]; then
    echo "NG  $subject  … cherry-pick -x の記録がありません"
    fail=1
  elif ! git merge-base --is-ancestor "$src" origin/main 2>/dev/null; then
    echo "NG  $subject  … 元コミット $src が main にありません（先に main へマージしてください）"
    fail=1
  else
    echo "OK  $subject  ← $src"
  fi
done

if git rev-list --merges "$base..HEAD" | grep -q .; then
  echo "NG  hotfix にマージコミットがあります（cherry-pick のみ許可）"
  fail=1
fi

exit $fail
