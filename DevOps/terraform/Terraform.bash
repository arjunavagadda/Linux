## Terraform

/usr/local/bin   >> terraform place there...

1. Configuration files - main.tf , ec2.tf , sg.tf
2. variable files - all vars will be declared here
3. Terraform vars - prod.tfvars & dev.tfvars
4. output
5. module


state file - terraform

plugins ::
- terraform init
- terraform plan
- terraform apply
- terraform destroy

>> terraform version - 0.13.0

terraform plan -out <.state>

terraform apply first.tfstate

terraform apply -auto-aprove

terraform output --> gives out the outputs

terraform state list

terraform show

terraform import

terraform validate --> validates the file

terraform workspace list


>> Variables

- command line with -var bucket_name = my-bucket

- terrform.tfvars


*** terraform force unlock

terraform force-unlock <id>

** if u want to create only particular resource

terraform apply -target=aws_vpc.<name>


terraform list data type

terraform fmt

terraform state list

