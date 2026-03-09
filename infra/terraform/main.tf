resource "aws_s3_bucket" "artifacts" {
  bucket = var.bucket_name
}

resource "aws_cloudwatch_log_group" "app" {
  name              = "/sre-portfolio/sample-app"
  retention_in_days = 14
}

output "s3_bucket_name" {
  value = aws_s3_bucket.artifacts.bucket
}

output "log_group_name" {
  value = aws_cloudwatch_log_group.app.name
}
