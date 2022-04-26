terraform {
    backend "s3" {
		bucket = "globaleaks-project-bucket"
		key = "globaleaks-instance-state"
   		region = "us-east-2"  
    }
}
