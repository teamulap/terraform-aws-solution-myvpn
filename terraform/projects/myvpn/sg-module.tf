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
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            type        = "ingress"
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            type        = "ingress"
            from_port   = 443
            to_port     = 443
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            type        = "ingress"
            from_port   = 943
            to_port     = 943
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            type        = "egress"
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        },
    ]

}
