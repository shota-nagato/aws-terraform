terraform {
  backend "s3" {
    bucket         = "terraform-state-146401978774"
    key            = "environments/dev/terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}