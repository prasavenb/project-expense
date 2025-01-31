locals {
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  resource_name = "${var.project_name}-${var.environment}"
  vpn_sg_id = data.aws_ssm_parameter.vpn_sg_id.value
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
}
