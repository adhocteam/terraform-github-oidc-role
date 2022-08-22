locals {
  gha_assume_role_sub = var.repository_access_type == "branch" ? "repo:${var.repository_name}:refs/heads/${var.repository_access_branch}" : "repo:${var.repository_name}:*"
}

data "aws_caller_identity" "current" {
}

data "aws_iam_openid_connect_provider" "main" {
  arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"
}

# Create the IAM role

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      type   = "Federated"
      values = [data.aws_iam_openid_connect_provider.main.arn]
    }
    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values = [
        "sts.amazonaws.com"
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values = [
        local.gha_assume_role_sub
      ]
    }
  }
}


resource "aws_iam_role" "main" {
  name               = var.role_name
  path               = var.role_path
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}


resource "aws_iam_role_policy" "customPolicy" {
  for_each = length(var.extra_iam_policies) > 0 ? { for name in var.extra_iam_policies : name.policy_name => name } : {}
  name     = each.value.policy_name
  role     = aws_iam_role.main.name
  policy   = each.value.policy_object
}
