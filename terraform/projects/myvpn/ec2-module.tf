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
    ssh_key_name        = "my-key"
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
    ssh_public_key      = "${get_env("ID_RSA")}"
    user_data           = "${file("./scripts/startup.sh")}"
}