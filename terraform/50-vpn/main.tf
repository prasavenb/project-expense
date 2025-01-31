resource "aws_key_pair" "openvpn" {
  key_name   = "openvpn"
  public_key = file("~/.ssh/openvpn.pub")  
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "${local.resource_name}-vpn"
  instance_type          = "t2.micro"  
  vpc_security_group_ids = [local.vpn_sg_id]
  subnet_id              = local.public_subnet_id
  ami = data.aws_ami.joindevops.id
  #key_name = "openvpn"
  key_name = aws_key_pair.openvpn.key_name

  tags = merge(
    var.common_tags,
    {
        Name = "${local.resource_name}-vpn"
    }
  )  
}

