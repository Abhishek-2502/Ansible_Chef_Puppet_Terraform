# This Terraform configuration creates a S3 bucket named "mybucketabhishek123" with the tags "Name" and "Environment".
# Setup AWS CLI and configure it with your credentials using IAM user

resource aws_s3_bucket mybucket {
  bucket = "mybucketabhishek123"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  } 
}


# Make provider.tf to config aws provider to change region