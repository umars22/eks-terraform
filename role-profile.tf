resource "aws_iam_instance_profile" "role-profile" {
  name = "profile-role"
  role = aws_iam_role.my-role.name
}
