###Creates the bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_master_key_arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
  tags = var.tags
}

### ENforces Bucket Ownership
resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

###Blocks public access
resource "aws_s3_bucket_public_access_block" "this" {
  count = var.block_public_access ? 1 : 0
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

### enables versioning
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.mybucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}