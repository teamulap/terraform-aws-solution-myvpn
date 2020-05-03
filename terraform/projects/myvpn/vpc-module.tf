module "vpc" {
    source = "git@github.com:teamulap/terraform-aws-module-vpc.git//terraform/modules?ref=v0.0.2"
    region                       = "ap-northeast-1"
    vpc_cidr                     = "10.0.0.0/16"
    vpc_subnets                  = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24"]
    vpc_subnet_availability_zone = ["ap-northeast-1a","ap-northeast-1c","ap-northeast-1d"]
    vpc_enable_dns_hostnames     = "true"
    vpc_tags                     = {
        Name         = "myVPN-VPC"
        Project      = "myVPN"
        Environment  = "development"
        Contact      = "jcbagtas"
        Temporary    = "true"
        CostCenter   = "JC"
        Terraform    = "true"
        ManagedBy    = "jcbagtas"
    }
}