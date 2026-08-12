data "aws_iam_policy_document" "github_actions_permissions" {
  statement {
    effect = "Allow"

    actions = [
      "s3:*",
      "cloudfront:*",
      "wafv2:*",
      "iam:GetRole",
      "iam:CreateRole",
      "iam:DeleteRole",
      "iam:PutRolePolicy",
      "iam:DeleteRolePolicy",
      "iam:AttachRolePolicy",
      "iam:DetachRolePolicy",
      "iam:PassRole"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "github_actions" {
  name   = "enterprise-static-cdn-github-actions"
  role   = aws_iam_role.github_actions.id
  policy = data.aws_iam_policy_document.github_actions_permissions.json
}
