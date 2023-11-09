output "sg_ec2_id" {
  description = "id of the EC2 SG"
  value       = aws_security_group.sg_test.id
}
