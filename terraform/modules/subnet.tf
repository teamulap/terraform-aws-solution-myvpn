resource "aws_subnet" "subnet" {
    count = "${length(var.vpc_subnets)}"
    availability_zone = "${var.vpc_subnet_availability_zone[count.index]}"
    vpc_id     = "${aws_vpc.vpc.id}"
    cidr_block = "${var.vpc_subnets[count.index]}"
    tags = "${var.vpc_tags}"
}