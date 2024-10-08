# AWSプロバイダーの設定

provider "aws" {
  region = "ap-northeast-1"
}

# 現在のAWSアカウントIDを取得
# リソース名にアカウントIDを含めるために使用される
data "aws_caller_identity" "current" {}

# Terraformの状態を保存するS3バケットを作成します
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name    = "terraform-state-${data.aws_caller_identity.current.account_id}"
    Project = var.project_name
  }
}

# 状態ファイルの変更履歴を保持するためS3バケットのバージョニングを有効化
resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# サーバーサイド暗号化を有効にする
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# パブリックアクセスをブロックする
resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Terraformの状態ロック管理用のDynamoDBテーブル
resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name     = "terraform-state-lock"
    Project  = var.project_name
    ManageBy = "Terraform"
  }
}
