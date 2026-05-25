# bucket creation 
resource "aws_s3_bucket" "alb_access_logs_bucket" {
  bucket = "alb-access-logs"

object_lock_enabled = true
}

# bucket versioning
resource "aws_s3_bucket_versioning" "alb_access_logs_versioning" {
  bucket = aws_s3_bucket.alb_access_logs_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
# bucket object lock configuration
resource "aws_s3_bucket_object_lock_configuration" "alb_access_logs_object_lock_config" {
  bucket = aws_s3_bucket.alb_access_logs_bucket.id

  rule {
    default_retention {
      mode = "GOVERNANCE" #USED GOVERNANCE SO IT CAN BE DELETED 
      days = 30
    }
  }
}
# public access block 
resource "aws_s3_bucket_public_access_block" "alb_access_logs_public_access_block" {
 bucket = aws_s3_bucket.alb_access_logs_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# bucket sse 
resource "aws_s3_bucket_server_side_encryption_configuration" "name" {
 bucket = aws_s3_bucket.alb_access_logs_bucket.id
rule {
  apply_server_side_encryption_by_default {
    sse_algorithm = "AES256"

   }
 }
}
resource "aws_s3_bucket_policy" "access_logs_bucket_policy" {
 bucket =  aws_s3_bucket.alb_access_logs_bucket.id

 policy = jsonencode({
    Version = 2012-10-17

   "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "logdelivery.elasticloadbalancing.amazonaws.com"
      },
      "Action": "s3:PutObject"
      "resource": "${aws_s3_bucket.alb_access_logs_bucket.arn}/*"
    }]
  })
}