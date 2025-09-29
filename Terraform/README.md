## Basic Topics:

1. **Block:** A container for a set of arguments and attributes.
2. **Block Types:** resource, provider, variable, output, terraform data, module, locals
3. **Block parameters:** The name of the block type.
4. **Arguments:** Key-Value pairs that define the properties of the block before the execution.
5. **Attributes:** Key-Value pairs that define the properties of the block after the execution.
6. **Provider: ** A plugin that Terraform uses to interact with APIs.
7. **Resource:** A component of your infrastructure that Terraform manages.
8. **Variable:** A placeholder for a value that can be passed to the configuration.
9. **Output:** A value that is returned after the execution of the configuration.

10. **main.tf:** Conventionally used to hold the core resource configuration in Terraform projects.
11. **plan.tf:** Default file created by Terraform to store the execution plan.
12. **.terraform:** Directory that contain Provider plugins and metadata.


## Basic Syntax:
```
block parameters{
    arguments = "value"
    argument = "value"
}
```


Init -> plan -> apply

## Commands:
### INITIALIZE COMMANDS:
- **terraform init:** 
Initialize the Terraform working directory. This command downloads the necessary provider plugins and sets up the backend for state management.

- **terraform init -upgrade:** 
Upgrade the provider plugins to the latest version. This is useful when you want to ensure that you are using the latest features and bug fixes in the providers.

### VALIDATE COMMANDS:
- **terraform validate (optional):** 
Validate the Terraform configuration files. This command checks for syntax errors and ensures that the configuration is valid before applying it.

### PLAN COMMANDS
- **terraform plan:** 
Generate an execution plan. This command shows what actions Terraform will take to create or update the infrastructure based on the current configuration and state file. It does not make any changes to the infrastructure.

- **terraform plan -out=tfplan:** 
Save the execution plan to a file named tfplan. This allows you to review the plan before applying it.

### APPLY COMMANDS:
- **terraform apply:** 
Generate and apply the execution plan. This command will create or update the infrastructure based on the current configuration and state file. It will prompt for confirmation before making any changes unless the -auto-approve flag is used.
- **terraform apply -auto-approve:** 
Automatically approve and apply the changes without prompting for confirmation. This is useful for automation scripts or when you are confident about the changes being made.

### DESTROY COMMANDS
- **terraform destroy:** 
Destroy the managed infrastructure. This command will remove all resources defined in the Terraform configuration files. It will prompt for confirmation before making any changes unless the -auto-approve flag is used.
- **terraform destroy -auto-approve**
- **terraform destroy --target=targetname:** 
Destroy specific resource

### FORMATE COMMAND
- **terraform fmt:** 
Formate all tf files to a canonical format and style, making them easier to read and maintain.


### STATE COMMANDS
- **terraform refresh:** 
Used to update the state file with the latest information from the infrastructure

- **terraform state list:** 
List down running resources

- **terraform state show resource_name:** 
Show the details of a specific resource in the state file

- **terraform state rm resource_name:** 
Remove a resource from the state file without destroying it
- **terraform state mv old_resource_name new_resource_name:** 
Move a resource in the state file to a new name
- **terraform state replace-provider old_provider new_provider:**
Replace the provider in the state file

- **terraform state pull:** 
Download the latest state file from the remote backend
- **terraform state push:** 
Upload the local state file to the remote backend

- **terraform state untaint resource_name:** 
Mark a resource as not tainted, meaning it will not be recreated on the next apply
- **terraform state taint resource_name:** 
Mark a resource as tainted, meaning it will be recreated on the next apply


### Provider
Make terraform.tf to download provider manually.
