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
  path = "/cli/"
}

resource "aws_iam_access_key" "vpc_reader" {
  user = aws_iam_user.vpc_reader.name
}

resource "aws_iam_group_membership" "vpc_readers" {
  name = "group-membership-vpc-readers"

  users = [
    aws_iam_user.vpc_reader.name,
  ]

  group = aws_iam_group.vpc_readers.name
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    sid     = "AllowCliVPCReaderUserToAssumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [aws_iam_user.vpc_reader.arn]
    }
  }
}

resource "aws_iam_role" "VPCAdmin" {
  name               = "VPCAdmin"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "vpc_admin_readonly" {
  role       = aws_iam_role.VPCAdmin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCReadOnlyAccess"
}

data "aws_iam_policy_document" "dynamodb" {
  statement {
    effect = "Allow"
    actions = [
      "dynamodb:GetItem",
    ]
    resources = ["arn:aws:dynamodb:eu-west-1:850995531955:table/names"]
  }
}

resource "aws_iam_user" "dynamodb_test" {
  name = "dynamodb_test"
}

resource "aws_iam_access_key" "dynamodb_test" {
  user = aws_iam_user.dynamodb_test.name
}

resource "aws_iam_user_policy" "dynamodb_test_inline" {
  name   = "DynamoDBTestInlinePolicy"
  user   = aws_iam_user.dynamodb_test.name
  policy = data.aws_iam_policy_document.dynamodb.json
}
