provider "aws" {
    region = "us-east-1"
}

resource "aws_iam_user" "my_user" {
    name = "TJ"
}

resource "aws_iam_policy" "custom_policy" {
    name = "GlaciarEFSEC2"

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "elasticfilesystem:DescribeBackupPolicy",
                "elasticfilesystem:DescribeMountTargets",
                "ec2:DeleteTags",
                "elasticfilesystem:ListTagsForResource",
                "ec2:CreateTags",
                "ec2:CreateVpc",
                "elasticfilesystem:DescribeAccessPoints",
                "elasticfilesystem:DescribeAccountPreferences",
                "elasticfilesystem:DescribeTags",
                "elasticfilesystem:DescribeLifecycleConfiguration",
                "elasticfilesystem:ClientMount",
                "elasticfilesystem:DescribeFileSystemPolicy",
                "elasticfilesystem:DescribeFileSystems",
                "elasticfilesystem:DescribeMountTargetSecurityGroups"
            ],
            "Resource": "*"
        }
    ]
}
    EOF
}

resource "aws_iam_policy_attachment" "policy_bind" {
    name = "attachment"
    users = [aws_iam_user.my_user.name]
    policy_arn = aws_iam_policy.custom_policy.arn
}