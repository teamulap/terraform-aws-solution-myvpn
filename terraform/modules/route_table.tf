resource "aws_route_table" "rt" {
    count = "${length(var.vpc_subnets)}"
    vpc_id = "${aws_vpc.vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
    tags = "${var.vpc_tags}"
}
resource "aws_route_table_association" "rta" {
    count = "${length(var.vpc_subnets)}"
    subnet_id      = "${element(aws_subnet.subnet.*.id, count.index)}"
    route_table_id = "${element(aws_route_table.rt.*.id, count.index)}"
}