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
variable "backend_tags" {
    default = {
        component = "backend"
    }
}
variable "zone_name" {
    default = "vensa.online"
}