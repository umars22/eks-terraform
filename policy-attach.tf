resource "aws_iam_policy_attachment" "k8-policy" {
  name       = "ec2-attachment"
  roles      = [aws_iam_role.my-role.name]
  policy_arn = aws_iam_policy.my-policy.arn

}
