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
* Task-1 
   - Creating repo and pushing code to remote repos in Github.   
   - Creaing branches based on user stories.    
   - Pushing the branch to remote repo and raising the Pull Request.      
   - Inviting collaborators and assign as reviewer for approval.     
   - Deleting the branches once the PR is approved and merged.  


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
      terraform apply/destroy -target <resource>   
   - Terraform Lifecycle Args    
      - Prevent Destroy   
      - Create Before Destroy   
      - Ignore changes   
   - Terraform state commands    #hese actions will performed in statefile   
      - terraform state list       
      - terraform state show <resource>     
      - terraform state mv<resource-old-name> <resource-new-name>    
      - terraform state pull >> state.json  #To check the statefile.  

* Task-3    
   - Terraform state locking with DynamoDB Table.       
   - Removing resource from a statefile to avoid  destroy.    
      - Example: terraform state rm aws_dynamodb_table.terraform_lock   
      - Remove or comment the resource block in the Terraform block.     
   - Deleting commits with git reset              
      - Git Reset types are HARD,SOFT AND MIXED(Default).               
      - Hard reset will delete commits and files so which results on dataloss.               
         - git reset --hard HEAD~5 (or) git reset --hard <commit-id>             
      - Soft reset will delete commits not files nut files will be staged so we can create as a new commit.                
         - git reset --soft  HEAD~5 (or) git reset --soft <commit-id>            
      - Mixed reset work like as an soft reset and it is default.  or Mixed reset will delete commits but files will be unstaged so we need to add and commit.           
         - git reset --mixed HEAD~5 (or) git reset --mixed <commit-id>   

   - Revertiong changes with git revert            
      - The challenge with git reevert is commits get deleted.               
      - Using git revert we can revert changes without deleting commits.          
      - This can be achieved by removing the changes and creating a new commit.      
         - git revert <commit-id>       
         

   - Deleting and Restoring branches      
      - git branch -D <branch-name>  #delete local branch          
      - git push origin -d <branch-name>   #delete remote branch     
      - we can restore deleted branches using git reflog and checkout commits.
      - Create a branch you want and branch is restored.    

   - Cherry-pick can be used to merge specific commit from one branch to another branch.   
      - git cherry-pick <commit-id>   #To get specific commit in another branch  (or)     

   - Cherry-pick commits    
      - I want to take a commit in demo branch and merge it with dev branch.     
      - git checkout dev && git cherry-pick <commit-id-in-demo-branch>      
      - cherry-pick is good choice for hotfix      
    
   - Getting the terraform statefile from s3 bucket(remote backend) to local backend(locally).
      - terraform state pull > terraform.tfstate
      - comment the backend in provider.tf file
      - Run terraform init -migrate-state 
      - Store the local terraform state file in another new s3 bucket.
      - Edit some resources and check new statefile is updated.   

* Task-4         
   #Merge will not change commit history. means it won't rewrite the commit history.                  
   #Rebase will move the commits data above latest commit.while moving it will rewrite commit history.              
   - Understanding Git Merge and Rebase         
   - Git Interactive Rebase    
      - Delete specific commits    
      - Meld commit in to previous commit     
      - Edit multiple commit messages    
   - Dealing with large files in git.  #Large File System(LFS)    
      - By default GitHub blocks files larger than 100 MiB.     
      - navigate to folder where your large file is present it should be more than 100MB.    
      - sudo apt-get install git-lfs     
      - git lfs install    
      - git lfs track "*.zip" (or) git lfs track "*.mp4"  
      - git add .gitattributes        
      - git status          
      - git add . && git commit -m "commit message"               
      - git push origin <branch-name>             
      - git lfs fetch --all    #Only download the references not files.    
      - git lfs pull    #Download the files    
   - Git Stash  #if you dont want to commit the changes for some particular time we send that changes into stash by using git stash and commit it later by poping the stash.  (or)  git stash is used to temporarily save changes that you don't want to commit right away.     
      - git stash    
      - git stash list    
      - git stash pop    
* Task-5
   - Terraform Functions
      - count       
      - element    
      - length    
      - Dynamic block with for each 
      - locals #locals block           
      - toset   - it will remove duplicates amd maintain elements in unordered format in the  list.                 
      - distinct - Used with Lists it will remove duplicates and maintain elements in order format in the list.             
      - lookup      
      - map   
      - condition       
      - for   #loops       
      - for-each     
* Task-6         
   - When to use count and for-each            
      - count is a good choice when we use integer value for creating resources.       
      - If you are planning to use conditions,then count is a good choice.        
      - challenge with count is,it follows the indexing,so we can only add the item at end of the list.            
   - More about for-each and for               
   - provisioners  
      - File : Used for copying files from a local environment to a remote one 
      - Remote-exec : Runs commands or scripts on a remote resource over SSH or WinRM
      - Local-exec  : Runs commands or scripts on the machine where Terraform is executed          
   - null_resource/terraform_data 
   - terraform taint & untaint              

   


