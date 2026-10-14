#!/usr/bin/env bash
# 環境へデプロイする（雛形）。buildspec/deploy.yml から、対象アカウントのロールを引き受けた状態で呼ばれる。
#
# 使い方: deploy.sh <env> <image-uri@digest>
#   env:   dev | staging | prod
#   image: ビルドステージで作ったイメージ（全環境で同じダイジェストを使う = Build once, deploy many）
#
# デプロイ方式はプロジェクトに合わせて置き換える:
#   - ECS:    タスク定義を新リビジョンで登録 → update-service（デプロイサーキットブレーカー ＋ アラームで自動ロールバック）
#   - Lambda: update-function-code --image-uri → エイリアスを段階的に切替（CodeDeploy）
#   - CDK:    cdk deploy -c env=<env> -c image=<image>
set -euo pipefail

env=${1:?usage: deploy.sh <env> <image>}
image=${2:?usage: deploy.sh <env> <image>}

echo "deploy $image to $env (account: $(aws sts get-caller-identity --query Account --output text))"

# --- ECS の例 ---------------------------------------------------------------
# cluster="backend-$env"; service="backend"
# td=$(aws ecs describe-services --cluster "$cluster" --services "$service" \
#        --query 'services[0].taskDefinition' --output text)
# new_td=$(aws ecs describe-task-definition --task-definition "$td" --query taskDefinition \
#   | jq --arg img "$image" '.containerDefinitions[0].image = $img
#        | del(.taskDefinitionArn,.revision,.status,.requiresAttributes,.compatibilities,.registeredAt,.registeredBy)')
# arn=$(aws ecs register-task-definition --cli-input-json "$new_td" \
#        --query taskDefinition.taskDefinitionArn --output text)
# aws ecs update-service --cluster "$cluster" --service "$service" --task-definition "$arn"
# aws ecs wait services-stable --cluster "$cluster" --services "$service"
