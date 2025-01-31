variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
variable "project_name" {
    default =  "expense"
}
variable "environment" {
    default = "dev"
}
variable "common_tags" {
    default = {
        project = "expense"
        environment = "dev"
        terraform = true
    }
}
variable "public_cidr" {
    default = ["10.0.1.0/24", "10.0.11.0/24"]
}
variable "private_cidr" {
    default = ["10.0.2.0/24", "10.0.22.0/24"]
}
variable "database_cidr" {
    default = ["10.0.3.0/24", "10.0.33.0/24"]
}

variable "peer_owner_id" {
    default = "195275676275" #aws account id
}