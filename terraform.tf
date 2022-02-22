terraform {
	required_providers {
		aws = {
			version = ">= 2.8.0"
		}
	}
	
	backend "s3" {
		bucket = "backend-state-bucket-s3-785765"
		key = "backend/statefile"
		region = "ap-south-1"
    }  	
}