# This Terraform configuration creates a local file named "myfile.txt" with the content "Hello, World!".

# HCL: Hashicorp Configuration Language: Defines the resources and their configurations in a declarative way. It is used to describe the desired state of the infrastructure and how to achieve it in a human-readable format.

resource local_file myfile {
  filename = "myfile.txt"
  content  = "Hello, World!"
}

# resource:      block type
# local:         provider name
# local_file:    resource type from the `hashicorp/local` provider
# myfile:        resource name or instance name or identifier

# filename:      argument name
# content:       argument name
# myfile.txt:    argument value
# Hello, World!: argument value
