module "asg" {
  source = "./modules/asg"
  asg-name = var.asg-name
  max-size = var.max-size
  min-size = var.min-size
  desired = var.desired
  health_check_type = var.health_check_type
  policy-name = var.policy-name
  policy_type = var.policy_type
  target_value = var.target_value
  lb-id = module.alb.lb-id
  tg-arn = module.alb.tg-arn
  subnet-id = module.vpc.subnet-id
}