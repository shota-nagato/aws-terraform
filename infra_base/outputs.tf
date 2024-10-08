output "terraform_state_bucket" {
  description = "Terraform状態ファイルを保存するS3バケット"
  value       = aws_s3_bucket.terraform_state.terraform_state.name
}

output "terraform_state_lock_table" {
  description = "Terraform状態ロック用のDynamoDBテーブル"
  value       = aws_dynamodb_table.terraform_state_lock.name
}
