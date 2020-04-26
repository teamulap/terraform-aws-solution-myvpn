resource "aws_security_group" "sg" {
  name        = "${var.sg_name}"
  description = "${var.sg_description}"
  vpc_id      = "${aws_vpc.vpc.id}"
  tags        = "${var.sg_tags}"
}

