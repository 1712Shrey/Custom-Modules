resource "aws_autoscaling_group" "asg" {
  name                      = var.asg-name
  max_size                  = var.max-size
  min_size                  = var.min-size
  health_check_type        = var.health_check_type
  desired_capacity          = var.desired
  vpc_zone_identifier       = var.subnet-id
  

}

resource "aws_autoscaling_policy" "example" {
  autoscaling_group_name = var.asg-name
  name                   = var.policy-name
  policy_type            = var.policy_type
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = var.target_value
  }
}

resource "aws_autoscaling_attachment" "example" {
  autoscaling_group_name = var.asg-name
  elb                    = var.lb-id
  lb_target_group_arn    = var.tg-arn
}
