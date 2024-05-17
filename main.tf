module "vpc" {
  source           = "./vpc"
  vpc_cidr         = var.vpc_cidr
  public_cidr      = var.public_cidr
  public2_cidr     = var.public2_cidr
  private_app_cidr = var.private_app_cidr
  private_db_cidr  = var.private_db_cidr
  vpc_az           = var.vpc_az
  vpc_az2          = var.vpc_az2
}

module "networking" {
  source         = "./networking"
  vpc_id         = module.vpc.vpc_id
  tg_name        = var.tg_name
  tg-instance_id = module.ec2.web_server_instance_id
  lb_name        = var.lb_name
  lb_subnet1     = module.vpc.public_subnet_id_1
  lb_subnet2     = module.vpc.public_subnet_id_2
}

module "ec2" {
  source        = "./ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type

  ec2_webserver_sg_id = module.networking.web_server_sg
  ec2_appserver_sg_id = module.networking.app_server_sg
  ec2_dbserver_sg_id  = module.networking.db_server_sg

  web-server_script = var.web-server_script
  app-server_script = var.app-server_script
  db-server_script  = var.db-server_script

  ec2_webserver_name = var.ec2_webserver_name
  ec2_appserver_name = var.ec2_appserver_name
  ec2_dbserver_name  = var.ec2_dbserver_name

  web_server_subnet_id = module.vpc.public_subnet_id_1
  app_server_subnet_id = module.vpc.private_app_subnet_id
  db_server_subnet_id  = module.vpc.private_db_subnet_id
}