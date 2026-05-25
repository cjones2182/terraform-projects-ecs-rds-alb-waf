resource "aws_wafv2_web_acl" "main_waf" {
  name = "main-waf"
scope = "REGIONAL"

default_action {
  allow  {}
  }

 visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "main-waf"
    sampled_requests_enabled   = false
  }

  rule {
    name = "AWSManagedRulesCommonRuleSet"
    priority = 1

    override_action {
      none {}
    }
    statement {
      managed_rule_group_statement {
        name = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name = "AWSManagedRulesCommonRuleSet"
        sampled_requests_enabled = false
    }
  }

   rule {
    name = "AWSManagedRulesKnownBadInputsRuleSet"
    priority = 2

    override_action {
      none {}
    }
    statement {
      managed_rule_group_statement {
        name = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name = "AWSManagedRulesKnownBadInputsRuleSet"
        sampled_requests_enabled = false
    }
  }
  rule {
    name = "AWSManagedRulesAmazonIpReputationList"
    priority = 2

    override_action {
      none {}
    }
    statement {
      managed_rule_group_statement {
        name = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }
    visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name = "AWSManagedRulesAmazonIpReputationList"
        sampled_requests_enabled = false
    }
  }
  rule {
    name = "AWSManagedRulesKnownBadInputsRuleSet"
    priority = 2

    override_action {
      none {}
    }
    statement {
      managed_rule_group_statement {
        name = "AAWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name = "AWSManagedRulesKnownBadInputsRuleSet"
        sampled_requests_enabled = false
    }
  }
}
resource "aws_wafv2_web_acl_association" "aws_wafv2_web_acl_association" {
  web_acl_arn = aws_wafv2_web_acl.main_waf.arn
  resource_arn = var.main_alb
}
