# Pre set permission to attach the administratoraccess policy to the role

resource "aws_iam_role_policy_attachment" "AdministratorAccess" {
  count      = var.preset_permission_level == "FullAdministrator" ? 1 : 0
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
