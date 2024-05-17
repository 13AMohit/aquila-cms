##########################################
######### VPC ###########################

variable "vpc_cidr" {
}
variable "public_cidr" {
}
variable "public2_cidr" {
}
variable "private_app_cidr" {
}
variable "private_db_cidr" {
}
variable "vpc_az" {
}
variable "vpc_az2" {
}

###########################################
############### Networking ################
variable "tg_name" {
}
variable "lb_name" {
}

###########################################
############# EC2 #########################

variable "ami_id" {
}
variable "instance_type" {
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