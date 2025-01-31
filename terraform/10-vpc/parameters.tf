resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.environment}/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id
  overwrite = true
}
resource "aws_ssm_parameter" "igw_id" {
  name  = "/${var.project_name}/${var.environment}/igw_id"
  type  = "String"
  value = module.vpc.igw_id
  overwrite = true
}
  
resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/public_subnet_ids"
  type  = "StringList"
  value = join(",", module.vpc.public_subnet_ids)
  overwrite = true
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/private_subnet_ids"
  type  = "StringList"
  value = join(",", module.vpc.private_subnet_ids)
  overwrite = true
}

resource "aws_ssm_parameter" "database_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/databse_subnet_ids"
  type  = "StringList"
  value = join(",", module.vpc.database_subnet_ids)
  overwrite = true
}

resource "aws_ssm_parameter" "db_subnet_group_arn" {
  name  = "/${var.project_name}/${var.environment}/db_group_subnet_arn"
  type  = "String"
  value = module.vpc.db_subnet_group_arn
  overwrite = true
}

resource "aws_ssm_parameter" "db_subnet_group_name" {
  name  = "/${var.project_name}/${var.environment}/db_subnet_group_name"
  type  = "String"
  value = module.vpc.db_subnet_group_name
  overwrite = true
}

resource "aws_ssm_parameter" "nat_gateway_id" {
  name  = "/${var.project_name}/${var.environment}/nat_gateway_id"
  type  = "String"
  value = module.vpc.nat_gateway_id
  overwrite = true
}

resource "aws_ssm_parameter" "public_route_table_id" {
  name  = "/${var.project_name}/${var.environment}/public_route_table_id"
  type  = "String"
  value = module.vpc.public_route_table_id
  overwrite = true
}

resource "aws_ssm_parameter" "private_route_table_id" {
  name  = "/${var.project_name}/${var.environment}/private_route_table_id"
  type  = "String"
  value = module.vpc.private_route_table_id
  overwrite = true
}

resource "aws_ssm_parameter" "database_route_table_id" {
  name  = "/${var.project_name}/${var.environment}/database_route_table_id"
  type  = "String"
  value = module.vpc.database_route_table_id
  overwrite = true
}

