# DEVOPS-PROJECT
This creates a CICD pipeline in a Jenkins Server which has been created by a different Template to run as a remote Server on AWS. (See Project CICD-Terraform-EKS )
The Steps to create the pipeline are as follows: Create New Item in Jenkins Server
Choose Project Name and select Freestyle Project
This job is parameterized- add parameters being REGION, VPC_ID, CLUSTER NAME
Source Code Management = Git then add url from your git repository- no credentials and choose branch
Delete Workspace before build starts
Build Steps = Execute Shell and paste your script in here.
To automate = Build when a change is pushed to Gitlab (if using Gitlab) alternatively configure Github with personal access token for connectivity 
Under Source Code Management, select Git and enter your repository URL.
Under Build Triggers, check the GitHub hook trigger for GITScm polling option.

