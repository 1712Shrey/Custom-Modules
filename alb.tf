module "alb" {
  source      = "./modules/alb"
  lb-name     = var.lb-name
  lb-type     = var.lb-type
  tg-name     = var.tg-name
  protocol    = var.protocol
  port        = var.port
  action_type = var.action_type
  sg-id = module.vpc.sg-id
  subnet-id = module.vpc.subnet-id
  vpc-id = module.vpc.vpc-id
  instance-id = module.ec2.instance-id
  cnt = var.cnt
}
