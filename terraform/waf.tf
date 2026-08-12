resource "aws_wafv2_web_acl" "cloudfront" {
  name  = "enterprise-static-cdn-waf"
  scope = "CLOUDFRONT"

  default_action {
    allow {}
  }

  rule {
    name     = "AWSManagedRulesCommonRuleSet"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "enterprise-static-cdn-common-rules"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "enterprise-static-cdn-waf"
    sampled_requests_enabled   = true
  }

  tags = {
    Name        = "Enterprise Static CDN WAF"
    Environment = "dev"
    Project     = "enterprise-static-asset-cdn"
  }
}
