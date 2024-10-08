variable "network_identifier" {
  description = "ネットワークの識別子"
  type        = string
}

variable "vpc_cidr" {
  description = "VPCのCIDRブロック"
  type        = string
}

variable "availability_zones" {
  description = "使用するアベイラビリティーゾーンのリスト"
  type        = list(string)
}

variable "environment" {
  description = "環境"
  type        = string
}
