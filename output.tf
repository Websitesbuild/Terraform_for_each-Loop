output "instance_public_ips" {
  description = "Public IPs of all EC2 instances"
  value = {
    for key, instance in aws_instance.Loop-VM :
    key => instance.public_ip
  }
}
