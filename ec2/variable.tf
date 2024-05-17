variable "ami_id" {
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "ec2_webserver_sg_id" {
}
variable "ec2_appserver_sg_id" {
}
variable "ec2_dbserver_sg_id" {
}
variable "app-server_script" {
}
variable "web-server_script" {
}
variable "db-server_script" {
}
variable "ec2_appserver_name" {
}
variable "ec2_webserver_name" {
}
variable "ec2_dbserver_name" {
}
variable "app_server_subnet_id" {
}
variable "web_server_subnet_id" {
}
variable "db_server_subnet_id" {
}