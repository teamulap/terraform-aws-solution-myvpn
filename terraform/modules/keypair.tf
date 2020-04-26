resource "aws_key_pair" "default" {
    count      = "${var.ssh_public_key!="" ? var.nb_instances : 0}"
    key_name   = "${var.ssh_key_name}-${var.instance_set_name}-${count.index}"
    public_key = "${var.ssh_public_key}"
}
