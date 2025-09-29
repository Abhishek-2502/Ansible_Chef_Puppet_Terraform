# State Management (terraform.tfstate):
# The state file is used to keep track of the resources that Terraform manages.
# The state file is a JSON file that contains the current state of your infrastructure.
# It is important to keep the state file secure and backed up.

# terraform refresh: Used to update the state file with the latest information from the infrastructure

# terraform state list: List down running resources

# terraform state show resource_name: Show the details of a specific resource in the state file

# terraform state rm resource_name: Remove a resource from the state file without destroying it
# terraform import resource_type.resource_name resource_id: Import an existing resource into the state file

# terraform state mv old_resource_name new_resource_name: Move a resource in the state file to a new name
# terraform state replace-provider old_provider new_provider: Replace the provider in the state file

# terraform state pull: Download the latest state file from the remote backend
# terraform state push: Upload the local state file to the remote backend

# terraform state untaint resource_name: Mark a resource as not tainted, meaning it will not be recreated on the next apply
# terraform state taint resource_name: Mark a resource as tainted, meaning it will be recreated on the next apply

resource aws_s3_bucket mybucket {
  bucket = "mybucketabhishek123"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  } 
}

