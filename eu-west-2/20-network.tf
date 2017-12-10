# An internal subnet for EC2 instances
resource "aws_subnet" "default" {
  vpc_id = "${aws_vpc.default.id}"

  count = "${length(split(",", var.azs))}"
  availability_zone = "${element(split(",", var.azs), count.index)}"
  cidr_block = "${element(split(",", var.cidrs), count.index)}"
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.default.ipv6_cidr_block, 8, count.index)}"

  map_public_ip_on_launch = true
  assign_ipv6_address_on_creation = true
}

# Security Groups

# Instance security group
resource "aws_security_group" "bastion" {
  name = "bastion"
  vpc_id = "${aws_vpc.default.id}"

  # SSH from anywhere
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound to internet
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ELB security group
resource "aws_security_group" "web" {
  name = "web"
  vpc_id = "${aws_vpc.default.id}"

  # HTTP from anywhere
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS from anywhere
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH from bastion
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = ["${aws_security_group.bastion.id}"]
  }

  # Outbound to internet
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = ["aws_internet_gateway.default"]
}


# Load Balancers

resource "aws_alb_target_group" "web" {
  name = "web"
  port = 80
  protocol = "HTTP"
  vpc_id = "${aws_vpc.default.id}"
  target_type = "ip"
}

resource "aws_alb" "web" {
  name = "web"
  security_groups = [
    "${aws_security_group.web.id}"
  ]
  subnets = [
    "${aws_subnet.default.*.id}"
  ]

  ip_address_type = "dualstack"
}

resource "aws_alb_listener" "web" {
  load_balancer_arn = "${aws_alb.web.arn}"
  port = "80"
  protocol = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.web.arn}"
    type = "forward"
  }
}
