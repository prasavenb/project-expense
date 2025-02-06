module "web_alb" {
  source = "terraform-aws-modules/alb/aws"
  name    = local.resource_name
  vpc_id  = local.vpc_id
  subnets = local.public_subnet_ids
  create_security_group = false
  enable_deletion_protection  = false
  internal = false
  security_groups = [local.web_alb_sg_id]
  tags = merge(
    var.common_tags,
    {
      Name = local.resource_name
    }
  )
}

resource "aws_lb_listener" "web_alb_HTTP" {
  load_balancer_arn = module.web_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hi, I am from web alb on port 80</h1>"
      status_code  = "200"
    }
  }
}
resource "aws_lb_listener" "web_alb_HTTPS" {
  load_balancer_arn = module.web_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = local.acm_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hi, I am from web alb on port 443</h1>"
      status_code  = "200"
    }
  }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  zone_name = var.zone_name
  records = [
    {
      name    = "expense-${var.environment}"
      type    = "A"
      alias   = {
        name    = module.web_alb.dns_name
        zone_id = module.web_alb.zone_id
      }
      allow_overwrite = true
    }    
  ]
}