module "myvpn" {
    source = "../../../terraform/modules"
    nb_instances = "1"
    region = "eu-north-1"
    instance_type = "t3.nano"
    instance_set_name = "vpn"
    ssh_key_name = "my-key"
    ami_mostrecent = "true"
    ami_id = "ami-0b7a46b4bd694e8a6"
    instance_tags = {
        name = "EC2-04252020-1"
        project = "myVPN"
        environment = "development"
        contact = "jcbagtas"
        temporary = "true"
        costCenter = "JC"
        terraform = "true"
        managedBy = "jcbagtas"
    }
    instance_subnet = "0"

    #This should be a module
    vpc_cidr          = "10.0.0.0/16"
    vpc_subnets       = ["10.0.0.0/24"]
    vpc_subnet_availability_zone = ["eu-north-1a"]
    vpc_enable_dns_hostnames = "true"
    vpc_tags = {
        name = "VPC-04252020-1"
        project = "myVPN"
        environment = "development"
        contact = "jcbagtas"
        temporary = "true"
        costCenter = "JC"
        terraform = "true"
        managedBy = "jcbagtas"
    }

    #This should be a module
    sg_name = "vpn-sg-1"
    sg_description = "myVPN Security Group"
    sg_tags = {
        name = "vpn-sg-1"
        project = "myVPN"
        environment = "development"
        contact  = "jcbagtas"
        temporary = "true"
        costCenter = "JC"
        terraform = "true"
        managedBy = "jcbagtas"
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
