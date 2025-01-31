module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "${local.resource_name}-bastion"
  instance_type          = "t2.micro"  
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id              = local.public_subnet_id
  ami = data.aws_ami.joindevops.id
  tags = merge(
    var.common_tags,
    {
        Name = "${local.resource_name}-bastion"
    }
  )  
}