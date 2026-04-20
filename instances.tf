resource "aws_instance" "Loop-VM" {
  for_each = var.instances
  ami = var.instances[each.key].ami
  instance_type = var.instances[each.key].instance_type
  tags = {
    Name = "EC2-${each.key}"
  }
}
