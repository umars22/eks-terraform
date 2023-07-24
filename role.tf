resource "aws_iam_role" "my-role" {
  name = "terraform-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    tag-key = "for-k8"
  }
}
