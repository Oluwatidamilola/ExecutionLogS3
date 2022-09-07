resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.mybucket.id
  policy = var.bucket_policy_rendered
}
