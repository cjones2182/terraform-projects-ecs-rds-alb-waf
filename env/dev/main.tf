# =================
# vpc 
# =================
module "vpc" {
  source             = "../../modules/vpc"
  vpc_cidr_block     = var.vpc_cidr_block
  public_subnets     = var.public_subnets
  availability_zones = var.availability_zones
  private_subnets    = var.private_subnets
  database_subnets   = var.database_subnets
  environment        = var.environment
}
module "security-groups" {
  source      = "../../modules/security-groups"
  vpc_id      = module.vpc.vpc_id
  environment = var.environment
}
module "alb" {
  source             = "../../modules/alb"
  alb_security_group = module.security-groups.alb_security_group
  public_subnets     = module.vpc.public_subnets
  vpc_id             = module.vpc.vpc_id
  environment        = var.environment
  central_log_bucket281330 = module.s3.central_log_bucket281330
}
module "s3" {
  source = "../../modules/s3"
}
module "ecs" {
  source = "../../modules/ecs"
  environment = var.environment
}
module "waf" {
  source   = "../../modules/waf"
  main_alb = module.alb.main_alb
}
module "secrets" {
  source = "../../modules/secrets"
}
module "rds" {
  source                    = "../../modules/rds"
  aws_secretsmanager_secret = module.secrets.aws_secretsmanager_secret
  rds_security_group        = module.security-groups.rds_security_group
  database_subnets          = module.vpc.database_subnets
}
