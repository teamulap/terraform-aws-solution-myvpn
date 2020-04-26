output "ec2_ids" {
  value = "${module.ec2.ec2_ids}"
}
output "sg_id" {
  value = "${module.sg.security_group_id}"
}
output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}
output "subnet_ids" {
  value = "${module.vpc.subnet_ids}"
}