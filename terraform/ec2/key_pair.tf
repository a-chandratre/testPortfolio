resource "aws_key_pair" "server" {
  public_key = file(var.public_key)
}


