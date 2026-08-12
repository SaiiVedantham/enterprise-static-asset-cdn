terraform {
  backend "s3" {
    bucket       = "enterprise-static-cdn-sai-tfstate-2026"
    key          = "enterprise-static-asset-cdn/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
