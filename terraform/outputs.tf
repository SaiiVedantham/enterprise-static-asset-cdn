output "s3_bucket_name" {
  description = "S3 bucket containing static assets"
  value       = aws_s3_bucket.assets.bucket
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  value       = aws_cloudfront_distribution.assets.id
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain"
  value       = aws_cloudfront_distribution.assets.domain_name
}

output "cloudfront_url" {
  description = "CloudFront HTTPS URL"
  value       = "https://${aws_cloudfront_distribution.assets.domain_name}"
}
