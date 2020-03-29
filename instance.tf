resource "aws_instance" "example" {
  instance_type = var.instance_type
  ami           = var.ami
  subnet_id     = aws_subnet.public.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.external.id]
  key_name      =  var.key_name 
  user_data     =  file("templates/userdata.sh")
  tags = {
    Name = "WebServerPublic2"
    Terraform   = "true"
    Environment = var.environment
  }
}
