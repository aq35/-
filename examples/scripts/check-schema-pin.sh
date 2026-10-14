#!/usr/bin/env bash
# サブモジュール schema/ が、schema リポジトリの main にマージ済みのコミットを指しているか検査する。
# 未マージのブランチを指したままだと、そのブランチが消えた時点で誰もビルドできなくなる。
set -euo pipefail

git -C schema fetch -q origin +refs/heads/main:refs/remotes/origin/main
pinned=$(git -C schema rev-parse --short HEAD)

if git -C schema merge-base --is-ancestor HEAD origin/main; then
  echo "OK  schema/ = $pinned（schema の main にマージ済み）"
else
  echo "NG  schema/ = $pinned は schema リポジトリの main にありません。先に schema 側の PR をマージしてください。"
  exit 1
fi
