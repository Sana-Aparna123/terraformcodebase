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

### Git Topics Discussed
* Creating repo and pushing code to remote repos in Github.   
* Creaing branches based on user stories.    
* Pushing the branch to remote repo and raising the Pull Request.      
* Inviting collaborators and assign as reviewer for approval.     
* Deleting the branches once the PR is approved and merged.  


* Task-2  
   - Enforcing terrform version for all users?  
   - Using variables in Terraform Code?     
   - Using tfvars to pass variable information?  
   - git pull = git fetch + git merge 
   - How multile developers can edit the same code?       
   - How can we resolve merge conflicts?     
   - git commit --amend  to change the existing commit and which will create a new commit.    
   - Force pushing.Not recommended. git push origin <branch-name> --force    
   - Deploying specific terraform resource instead of running all code.     
      terraform apply -target <resource>        
    


