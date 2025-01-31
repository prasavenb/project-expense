module "backend" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "${local.resource_name}-backend"
  instance_type          = "t2.micro"  
  vpc_security_group_ids = [local.backend_sg_id]
  subnet_id              = local.private_subnet_id
  ami = data.aws_ami.joindevops.id
  tags = merge(
    var.common_tags,
    var.backend_tags,
    {
        Name = local.resource_name
    }
  )  
}

resource "null_resource" "backend" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    cluster_instance_ids = module.backend.id
  }
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = module.backend.private_ip
  }
  
  provisioner "file" {
    source      = "${var.backend_tags.Component}.sh"
    destination = "/tmp/backend.sh"
  }

  provisioner "remote-exec" {    
    inline = [
      "chmod +x backend.sh",
      "sudo sh backend.sh"
    ]
  }
}