## setup

1. IAM ユーザーの作成
2. [aws-vault](https://github.com/99designs/aws-vault) をインストール

```
# MacOSの場合
brew install --cask aws-vault
```

3. 認証情報・MFA の設定
4. 接続

```
aws-vault exec "your iam name"
```

## terraform command

```
# devディレクトリ配下の設定を反映する場合
docker compose run --rm terraform -chdir=environments/dev init
docker compose run --rm terraform -chdir=environments/dev plan
docker compose run --rm terraform -chdir=environments/dev apply
docker compose run --rm terraform -chdir=environments/dev destroy
```
