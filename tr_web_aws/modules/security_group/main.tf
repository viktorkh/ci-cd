resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "My Security Group"
  vpc_id      = var.vpc_id

  # Define inbound and outbound rules here
  # Example inbound rule:
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Example outbound rule:
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
