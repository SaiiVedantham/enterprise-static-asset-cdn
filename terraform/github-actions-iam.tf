data "aws_iam_policy_document" "github_actions_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type = "Federated"

      identifiers = [
        aws_iam_openid_connect_provider.github.arn
      ]
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
        "repo:SaiiVedantham@94446625/enterprise-static-asset-cdn@1330898051:ref:refs/heads/main",
        "repo:SaiiVedantham@94446625/enterprise-static-asset-cdn@1330898051:environment:production",
      ]
    }
  }
}

resource "aws_iam_role" "github_actions" {
  name = "enterprise-static-cdn-github-actions"

  assume_role_policy = data.aws_iam_policy_document.github_actions_assume_role.json

  tags = {
    Name        = "Enterprise Static CDN GitHub Actions"
    Environment = "dev"
    Project     = "enterprise-static-asset-cdn"
  }
}
