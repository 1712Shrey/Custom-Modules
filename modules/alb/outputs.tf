output "lb-id" {
  value = aws_lb.lb.id
}

output "tg-arn" {
  value = aws_lb_target_group.tg.arn
}