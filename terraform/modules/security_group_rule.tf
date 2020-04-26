resource "aws_security_group_rule" "sgr" {
    count             = "${length(var.sg_rules)}"
    type              = "${element(var.sg_rules.*.type, count.index)}"
    from_port         = "${element(var.sg_rules.*.from_port, count.index)}"
    to_port           = "${element(var.sg_rules.*.to_port, count.index)}"
    protocol          = "${element(var.sg_rules.*.protocol, count.index)}"
    cidr_blocks       = "${element(var.sg_rules.*.cidr_blocks, count.index)}"
    security_group_id = "${aws_security_group.sg.id}"
}