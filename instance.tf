resource "aws_instance" "example" {
  instance_type = var.instance_type
  ami           = var.ami
  subnet_id     = module.vpc.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = [module.vpc.scg_id]
  key_name      =  var.key_name 
  user_data     =  file("templates/userdata.sh")
  tags = {
    Name = "WebServerPublic2"
    Terraform   = "true"
    Environment = var.environment
  }
}
