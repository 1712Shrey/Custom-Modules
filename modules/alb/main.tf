resource "aws_lb" "lb" {
  //count = var.cnt
  name               = var.lb-name
  load_balancer_type = var.lb-type
  security_groups    = [var.sg-id]
  subnets            = var.subnet-id
  //subnets            = [var.subnet-id[count.index]]
  //subnets = [ aws_subnet.public[*].id]

#   enable_deletion_protection = true

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.id
#     prefix  = "test-lb"
#     enabled = true
#   }

#   tags = {
#     Environment = "production"
#   }
}

resource "aws_lb_target_group" "tg" {
  name     = var.tg-name
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc-id
  stickiness {
    enabled = true
    type = "lb_cookie"
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = var.port
  protocol          = var.protocol
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = var.action_type
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_target_group_attachment" "attach" {
  count = var.cnt
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = element(var.instance-id, count.index)
  port             = var.port
}