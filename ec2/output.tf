output "web_server_instance_id" {
  value = aws_instance.web_ec2_instance.id
}
output "app_server_instance_id" {
  value = aws_instance.app_ec2_instance.id
}
output "db_server_instance_id" {
  value = aws_instance.db_ec2_instance.id
}