resource "aws_instance" "web" {
  ami           = var.ami-id
  instance_type = var.type
  count = var.cnt
  subnet_id = element(var.subnet-id, count.index)
  vpc_security_group_ids = [var.sg-id]

  tags = {
    Name = "${var.i-name}-${count.index+1}"
  }
}

