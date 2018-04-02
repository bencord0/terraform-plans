data "aws_iam_policy_document" "assume_ecs" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com",
        "ecs.amazonaws.com",
      ]
    }
  }
}

data "aws_iam_policy_document" "ecs" {
  statement {
    actions = [
      "ecs:DeregisterContainerInstance",
      "ecs:DiscoverPollEndpoint",
      "ecs:Poll",
      "ecs:RegisterContainerInstance",
      "ecs:StartTelemetrySession",
      "ecs:Submit*",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_role" "ecs" {
  name = "ecs"
  assume_role_policy = "${data.aws_iam_policy_document.assume_ecs.json}"
}

resource "aws_iam_role_policy" "ecs" {
  name = "ecs"
  policy = "${data.aws_iam_policy_document.ecs.json}"
  role = "${aws_iam_role.ecs.id}"
}

resource "aws_iam_instance_profile" "ecs" {
  name = "ecs"
  path = "/"
  role = "${aws_iam_role.ecs.name}"
}
