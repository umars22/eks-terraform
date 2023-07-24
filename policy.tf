resource "aws_iam_policy" "my-policy" {
  name        = "admin-policy"
  path        = "/"
  description = " policy for admin access"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "*",
        "Resource" : "*"
      }
    ]
  })
}
