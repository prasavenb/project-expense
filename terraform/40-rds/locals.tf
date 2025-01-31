locals {
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  resource_name = "${var.project_name}-${var.environment}"
  mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value  
  db_subnet_group_name = data.aws_ssm_parameter.db_subnet_group_name.value
}
