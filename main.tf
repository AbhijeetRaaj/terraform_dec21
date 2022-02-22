resource "aws_s3_bucket" "backend_state_bucket_s3" {
	bucket = "backend-state-bucket-s3-785765"
	
	#lifecycle {
	#	prevent_destory = true 
	#}
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.backend_state_bucket_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.backend_state_bucket_s3.bucket

  rule {
    apply_server_side_encryption_by_default {
		sse_algorithm     = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "backend_lock" {
	hash_key = "LockID"
	name = "dynamodb_backend_lock"
	billing_mode = "PAY_PER_REQUEST"
	attribute {
		name = "LockID"
		type = "S"
	}
}