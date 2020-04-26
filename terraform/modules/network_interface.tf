# resource "aws_network_interface" "nic" {
#   subnet_id   = "${element(aws_subnet.subnet.*.id, var.instance_subnet)}"
#   tags = "${var.vpc_tags}"
# }