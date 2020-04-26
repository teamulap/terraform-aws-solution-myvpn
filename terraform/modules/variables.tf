# EC2
variable "nb_instances" {
    type = "string"
    description = "(Required) Number of instances to spawn."
    default = "1"
}
variable "instance_set_name" {
    type = "string"
    description = "(Required) The Set name for your VM"
}
variable "instance_subnet" {
    type = "string"
    description = "(Required) Subnet where the instance will be spawned"
    default = "0"
}
variable "instance_public" {
    type = "string"
    description = "(Required) associate_public_ip_address to true or false"
    default = "true"
}


variable "instance_type" {
  type = "string"
  description = "(Required) The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
}

variable "instance_tags" {
  type = "map"
  description = "(Required) A map of tags to assign to the resource."
}

variable "ami_id" {
  type = "string"
  description = "(Required if ami_filter is not present) The AMI to use for the instance."
  default = ""
}

variable "ami_mostrecent" {
  type = "string"
  description = "(Optional) If more than one result is returned, use the most recent AMI."
  default = ""
}

variable "ami_owner" {
  type = "list"
  description = "(Required) List of AMI owners to limit search. At least 1 value must be specified. Valid values: an AWS account ID, self (the current account), or an AWS owner alias (e.g. amazon, aws-marketplace, microsoft)."
  default = ["self"]
}
variable "ami_filters" {
    type = "list"
    description = "(Optional) One or more name/value pairs to filter off of. There are several valid keys, for a full reference, check out describe-images in the AWS CLI reference."
    default = [{
        name=""
        values=[""]
    }]
}
variable "region" {
    type = "string"
    description = "(Required) The Region you want the resources to be in."
}

variable "ssh_public_key" {
    type = "string"
    description = "(Required) The public key material."
    default = ""
}
variable "ssh_key_name" {
    type = "string"
    description = "(Required) The public key name."
    default = "default-key"
}


#VPC


variable "vpc_subnets" {    
    type = "list"
    description = "(Required) List of CIDR blocks for the subnets."
}
variable "vpc_subnet_availability_zone" {
    type = "list"
    description = "(Required) The AZ for the subnet."
}

variable "vpc_cidr" {
    type = "string"
    description = "(Required) The CIDR block for the VPC."
}
variable "vpc_instance_tenancy" {
    type = "string"
    description = "(Optional) A tenancy option for instances launched into the VPC."
    default = "default"
}
variable "vpc_enable_dns_support" {
    type = "string"
    description = "(Optional) A boolean flag to enable/disable DNS support in the VPC. Defaults true."
    default = "true"
}
variable "vpc_enable_dns_hostnames" {
    type = "string"
    description = "(Optional) A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
    default = "false"
}
variable "vpc_enable_classiclink" {
    type = "string"
    description = "(Optional) A boolean flag to enable/disable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic. See the ClassicLink documentation for more information. Defaults false."
    default = "false"
}
variable "vpc_enable_classiclink_dns_support" {
    type = "string"
    description = "(Optional) A boolean flag to enable/disable ClassicLink DNS Support for the VPC. Only valid in regions and accounts that support EC2 Classic."
    default = "false"
}
variable "vpc_assign_generated_ipv6_cidr_block" {
    type = "string"
    description = "(Optional) Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block. Default is false."
    default = "false"
}
variable "vpc_tags" {
    type = "map"
    description = "(Required) A map of tags to assign to the resource."
}


# SG

variable "sg_name" {
  type = "string"
  description = "(Optional, Forces new resource) The name of the security group. If omitted, Terraform will assign a random, unique name"
}
variable "sg_description" {
  type = "string"
  description = "(Optional, Forces new resource) The security group description. Defaults to 'Managed by Terraform'. Cannot be ''. NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags."
}
variable "sg_tags" {
  type = "map"
  description = "(Required) A map of tags to assign to the resource."
}
variable "sg_rules" {
  type = "list"
  description  = "(Required) List of Security Group Rules. Represents a single ingress or egress group rule, which can be added to external Security Groups."
}