data "aws_iam_policy_document" "vpc_ro" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:DescribeVpcs",
      "ec2:DescribeSubnets",
      "ec2:DescribeInternetGateways",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "vpc_read_only" {
  name        = "VPCReadOnly"
  description = "Provides read only access to VPC data"
  policy      = data.aws_iam_policy_document.vpc_ro.json
}

resource "aws_iam_group" "vpc_readers" {
  name = "VPCReaders"
  path = "/"
}

resource "aws_iam_group_policy_attachment" "vpc_reader_attach" {
  group      = aws_iam_group.vpc_readers.name
  policy_arn = aws_iam_policy.vpc_read_only.arn
}

resource "aws_iam_user" "vpc_reader" {
  name = "VPCReader"
}

resource "aws_iam_group_membership" "vpc_readers" {
  name = "group-membership-vpc-readers"

  users = [
    aws_iam_user.vpc_reader.name,
  ]

  group = aws_iam_group.vpc_readers.name
}
