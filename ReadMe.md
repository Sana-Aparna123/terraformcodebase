### Terraform Resource Creation Syntax
resource "type-of-resource" "name-of-the-resource" {  
    arg1 = ?   
    arg2 = ?   
}   

### Terraform Workflow   
* terraform init  -  Downloads provider plugins,modules and create backend.   
* terraform fmt   - Align the code properly.     
* terraform validate - check for syntax issues or files configuration.   
* terraform plan - Dry run to check what resources are going to get deployed.   
* terraform apply - Execute terraform code to deploy resources.   
* terraform destroy - To destroy all the resources created by terraform.    

### Terraform Credentials for AWS.   
* nano ~/.bashrc   
* Add the below details in bash file     
   - export AWS_ACCESS_KEY_ID=''      
   - export AWS_SECRET_ACCESS_KEY=''     
   - export AWS_REGION = ''   
* source ~/.bashrc     
* update the access key and secret key details in  "~/.aws/credentials" file.
