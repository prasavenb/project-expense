module "vpc" {
    source = "git::https://github.com/prasavenb/terraform-vpc-module.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    vpc_cidr = var.vpc_cidr    
    common_tags = var.common_tags
    public_cidr = var.public_cidr
    private_cidr = var.private_cidr
    database_cidr = var.database_cidr
    is_peering_required = false
}