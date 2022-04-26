terraform {
    backend "s3" {
		bucket = "globaleaks-project-bucket"
		key = "globaleaks-network-state"
   		region = "us-east-2"  
    }
}
