output "web_server_sg" {
  value = aws_security_group.ec2_web_server_security_group.id
}
output "app_server_sg" {
  value = aws_security_group.ec2_app_server_security_group.id
}
output "db_server_sg" {
  value = aws_security_group.ec2_db_server_security_group.id
}