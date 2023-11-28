output "load_balancer_arn" {
  value       = aws_lb.first_load_balancer.arn
  description = "The ARN of the Load Balancer"
}

output "load_balancer_dns_name" {
  value       = aws_lb.first_load_balancer.dns_name
  description = "The DNS name of the Load Balancer"
}

output "load_balancer_zone_id" {
  value       = aws_lb.first_load_balancer.zone_id
  description = "The Zone ID of the Load Balancer"
}

output "listener_arn" {
  value       = aws_lb_listener.first_listener.arn
  description = "The ARN of the Load Balancer Listener"
}
