resource "aws_instance" "example" {
  ami           = "ami-0ff8a91507f77f867"
  count = var.instance_count
  #instance_type = "t3.micro"
  #conditional expression to set instance type based on environment variable
  instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"

  tags = var.tags
}



resource "aws_security_group" "ingress_rule" {
  name   = "sg"
#   vpc_id = aws_vpc.example.id
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
    
  }
}

output "security_group_ids" {
  value = [aws_security_group.ingress_rule.id]
}
