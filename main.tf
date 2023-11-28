module "networking" {
  source = "./modules/networking"

  vpc_name           = "putting_it_into_practice_vpc"
  cidr_range         = "10.0.0.0/20"
  availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  public_subnets     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24"]
}

module "security" {
  source = "./modules/security"

  vpc_id = module.networking.vpc_id
}

module "app_servers" {
  source = "./modules/app_servers"

  key_name          = var.key_name
  security_group_id = module.security.security_group_id
  subnet_id         = module.networking.public_subnets
}

module "load_balancing" {
  source = "./modules/load_balancing"

  vpc_id = module.networking.vpc_id
  instance_id = module.app_servers.instance_id

  public_subnets    = module.networking.public_subnets
  security_group_id = [module.security.security_group_id]
}
