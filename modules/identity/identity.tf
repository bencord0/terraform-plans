resource "aws_key_pair" "auth" {
  key_name_prefix = "${var.key_name}"
  public_key      = "${var.public_key}"
}
