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

variable "domain" {
    default = "vensa.online"
}

variable "zone_id" {
    default = "Z07511293FMH2POOUP6DK"
}
