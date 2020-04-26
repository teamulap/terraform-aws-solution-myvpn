resource "aws_instance" "access_server" {
    count = "${var.nb_instances}"
    ami           = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    key_name      = "${var.ssh_public_key=="" ? var.ssh_key_name : "${element(aws_key_pair.default.*.key_name, count.index)}"}"
    tags = "${var.instance_tags}"
    associate_public_ip_address = "${var.instance_public}"
    vpc_security_group_ids = ["${aws_security_group.sg.id}"]
    subnet_id = "${element(aws_subnet.subnet.*.id, var.instance_subnet)}"
    # network_interface {
    #     network_interface_id = "${aws_network_interface.nic.id}"
    #     device_index = 0
    # }
}
