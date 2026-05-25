output "alb_access_logs_bucket" {
 description = "alb_access logs bucket" 
 value = aws_s3_bucket.alb_access_logs_bucket.id
}