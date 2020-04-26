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
module "sg" {
    source = "git@github.com:teamulap/terraform-aws-module-security-group.git//terraform/modules?ref=v0.0.1"
    region = "ap-northeast-1"
    vpc_id = "${module.vpc.vpc_id}"
    sg_name = "myVPN-SG-1"
    sg_description = "myVPN Security Group"
    sg_tags = {
        Name = "myVPN-SG-1"
        Project = "myVPN"
        Environment = "development"
        Contact  = "jcbagtas"
        Temporary = "true"
        CostCenter = "JC"
        Terraform = "true"
        ManagedBy = "jcbagtas"
    }
    sg_rules = [
        {
            type        = "ingress"
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            cidr_blocks = ["120.29.75.172/32"]
        },
        {
            type        = "egress"
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            type        = "ingress"
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["120.29.75.172/32"]
        },
        {
            type        = "ingress"
            from_port   = 443
            to_port     = 443
            protocol    = "tcp"
            cidr_blocks = ["120.29.75.172/32"]
        },
        {
            type        = "ingress"
            from_port   = 943
            to_port     = 943
            protocol    = "tcp"
            cidr_blocks = ["120.29.75.172/32"]
        },
    ]

}
module "ec2" {
    source = "git@github.com:teamulap/terraform-aws-module-ec2.git//terraform/modules?ref=v0.0.1"
    region              = "ap-northeast-1"
    subnet_id           = "${module.vpc.subnet_ids[0]}"
    security_group_ids  = ["${module.sg.security_group_id}"]
    ami_id              = "ami-0f310fced6141e627"
    nb_instances        = "1"
    instance_type       = "t3.nano"
    instance_set_name   = "myVPN-EC2"
    associate_public_ip_address = "true"
    ssh_key_name        = "my-macx-key"
    instance_tags       = {
                            Name = "myVPN-EC2-1"
                            Project = "myVPN"
                            Environment = "development"
                            Contact = "jcbagtas"
                            Temporary = "true"
                            CostCenter = "JC"
                            Terraform = "true"
                            ManagedBy = "jcbagtas"
                            SomeTag = "SomeValue"
                        }
    ssh_public_key      = "${file("~/.ssh/id_rsa.pub")}"
    user_data           = "${file("./scripts/startup.sh")}"
}