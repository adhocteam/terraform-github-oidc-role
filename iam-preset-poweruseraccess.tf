# Pre set permission to attach the PowerUserAccess policy to the role

resource "aws_iam_role_policy_attachment" "PowerUserAccess" {
  count      = (var.preset_permission_level == "PowerUser" || var.preset_permission_level == "PowerUserWithIAM") ? 1 : 0
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

data "aws_iam_policy_document" "PowerUserIAMAccess" {
  statement {
    effect = "Allow"
    actions = [
      "iam:AddRoleToInstanceProfile",
      "iam:AddUserToGroup",
      "iam:AttachGroupPolicy",
      "iam:AttachRolePolicy",
      "iam:CreateGroup",
      "iam:CreateInstanceProfile",
      "iam:CreatePolicy",
      "iam:CreatePolicyVersion",
      "iam:CreateRole",
      "iam:CreateServiceLinkedRole",
      "iam:DeactivateMFADevice",
      "iam:DeleteGroup",
      "iam:DeleteGroupPolicy",
      "iam:DeleteInstanceProfile",
      "iam:DeletePolicy",
      "iam:DeletePolicyVersion",
      "iam:DeleteRole",
      "iam:DeleteRolePolicy",
      "iam:DeleteServerCertificate",
      "iam:DeleteServiceLinkedRole",
      "iam:DeleteUserPolicy",
      "iam:DeleteVirtualMFADevice",
      "iam:DetachGroupPolicy",
      "iam:DetachRolePolicy",
      "iam:GenerateCredentialReport",
      "iam:GenerateServiceLastAccessedDetails",
      "iam:Get*",
      "iam:List*",
      "iam:PassRole",
      "iam:PutGroupPolicy",
      "iam:PutRolePolicy",
      "iam:PutUserPolicy",
      "iam:RemoveRoleFromInstanceProfile",
      "iam:RemoveUserFromGroup",
      "iam:SetDefaultPolicyVersion",
      "iam:SimulateCustomPolicy",
      "iam:SimulatePrincipalPolicy",
      "iam:Tag*",
      "iam:Untag*",
      "iam:UpdateAssumeRolePolicy",
      "iam:UpdateGroup",
      "iam:UpdateRole",
      "iam:UpdateRoleDescription",
      "iam:UpdateServerCertificate",
      "iam:UploadServerCertificate"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "PowerUserAccessIAM" {
  count  = var.preset_permission_level == "PowerUserWithIAM" ? 1 : 0
  name   = "PowerUserLimitedIAMAccess"
  role   = aws_iam_role.main.name
  policy = data.aws_iam_policy_document.PowerUserIAMAccess.json
}
