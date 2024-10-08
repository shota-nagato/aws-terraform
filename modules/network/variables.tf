variable "network_identifier" {
  description = "ネットワークリソースの識別子"
  type        = string
}

variable "vpc_cidr" {
  description = "VPCのCIDRブロック"
  type        = string
}

# variable "public_subnet_cidrs" {
#   description = "パブリックサブネットのCIDRブロックのリスト"
#   type        = list(string)
# }

# variable "private_subnect_cidrs" {
#   description = "プライベートサブネットのCIDRブロックのリスト"
#   type        = list(string)
# }

# variable "availability_zones" {
#   description = "使用するアベイラビリティーゾーンのリスト"
#   type        = list(string)
# }

variable "environment" {
  description = "環境名 (dev, staging, prod)"
  type        = string
}
