resource "aws_lb_target_group" "first_target_group" {
  name     = "first-target-group"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path                = "/health-check"
    protocol            = "HTTP"
  }

  target_type = "instance"
}

# resource "aws_lb_target_group_attachment" "attach_instance_1" {
#   target_group_arn = aws_lb_target_group.first_target_group.arn
#   target_id        = var.instance_id_1
# }

# resource "aws_lb_target_group_attachment" "attach_instance_2" {
#   target_group_arn = aws_lb_target_group.first_target_group.arn
#   target_id        = var.instance_id_2
# }

resource "aws_lb_target_group_attachment" "attach_instance" {
  count = length(var.instance_id)
  target_group_arn = aws_lb_target_group.first_target_group.arn
  target_id = var.instance_id[count.index]
}

resource "aws_lb" "first_load_balancer" {
  name               = "first-load-balancer"
  load_balancer_type = "application"
  subnets            = var.public_subnets
  security_groups    = var.security_group_id
  internal           = false

  enable_deletion_protection = false
}

resource "aws_lb_listener" "first_listener" {
  load_balancer_arn = aws_lb.first_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.first_target_group.arn
  }
}
