locals {
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  resource_name = "${var.project_name}-${var.environment}"
  web_alb_sg_id = data.aws_ssm_parameter.app_alb_sg_id.value
  public_subnet_ids = split(",", data.aws_ssm_parameter.private_subnet_ids.value)
  acm_arn = data.aws_ssm_parameter.acm_arn.value
}
