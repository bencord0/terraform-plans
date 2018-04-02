resource "aws_security_group" "ecs" {
  name = "ecs"

  vpc_id = "${var.vpc_id}"

  # SSH from bastion
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    security_groups = ["${var.bastion_security_group_id}"]
  }

  # Outbound to the internet
  egress {
    from_port = 0
    to_port   = 0
    protocol  = -1

    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
