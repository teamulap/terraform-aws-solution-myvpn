output "vpc_id" {
  value = "aws_vpc.main.id"
}
output "instance_id" {
  value = "aws_instance.access_server.*.id"
}
