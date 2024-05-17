output "vpc_id" {
  value = aws_vpc.main.id
}
output "public_subnet_id_1" {
  value = aws_subnet.public_subnet.id
}
output "public_subnet_id_2" {
  value = aws_subnet.public_subnet2.id
}
output "private_app_subnet_id" {
  value = aws_subnet.private_app_subnet.id
}
output "private_db_subnet_id" {
  value = aws_subnet.private_db_subnet.id
}