# DEVOPS-PROJECT 1. (not automated)
This creates a CICD pipeline in a Jenkins Server which has been created by a different Template to run as a remote Server on AWS. (See Project CICD-Terraform-EKS )
The Steps to create the pipeline are as follows: Create New Item in Jenkins Server
Choose Project Name and select Freestyle Project
This job is parameterized- add parameters being REGION, VPC_ID, CLUSTER NAME
Source Code Management = Git then add url from your git repository- no credentials and choose branch
Delete Workspace before build starts
Build Steps = Execute Shell and paste your script in here.

# DEVOPS-PROJECT 2. (Automated Pipeline)
To automate = Build when a change is pushed to Github alternatively configure Gitlab. 
Step 1: Create a New Jenkins Pipeline Job
Create a New Item:

From the Jenkins dashboard, click New Item.
Enter a name for your project.
Select Pipeline as the project type.
Click OK.
Configure the Pipeline:

Scroll down to the Pipeline section.
Choose Pipeline script from SCM if you want Jenkins to pull the Jenkinsfile from your GitHub repository.
Step 2: Configure Source Code Management (SCM)
Select Git as the SCM.
Repository URL:
Enter the URL of your GitHub repository.
Example: https://github.com/username/repository-name.git.
Credentials:
If your repository is private, you need to add your GitHub credentials in Jenkins.
Click on Add > Jenkins and enter your GitHub username and password or personal access token.
Branch to Build:
Specify the branch you want to build, e.g., main.
Step 3: Create or Use a Jenkinsfile
The Jenkinsfile defines your pipeline and is typically stored in the root of your GitHub repository. Below is a basic example of a Jenkinsfile:

groovy
Copy code
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clone the repository
                git branch: 'main', url: 'https://github.com/username/repository-name.git'
            }
        }

        stage('Build') {
            steps {
                // Example: Run a shell command to build your project
                sh './build.sh'
            }
        }

        stage('Test') {
            steps {
                // Example: Run tests
                sh './test.sh'
            }
        }

        stage('Deploy') {
            steps {
                // Example: Deploy your project
                sh './deploy.sh'
            }
        }
    }
}
Step 4: Set Up GitHub Webhook (Optional but Recommended)
To automate the pipeline, set up a GitHub webhook:

Go to your GitHub repository.
Navigate to Settings > Webhooks.
Click Add webhook.
In the Payload URL, enter http://<JENKINS_URL>/github-webhook/.
Replace <JENKINS_URL> with your Jenkins server’s URL.
Set Content type to application/json.
Select the events you want to trigger the webhook. Typically, you select Push events.
Click Add webhook.
Step 5: Build and Test the Pipeline
Manual Trigger: You can manually trigger the build by clicking Build Now from the Jenkins dashboard.
Automatic Trigger: Once the GitHub webhook is set up, any push to the specified branch in the GitHub repository will trigger the Jenkins pipeline automatically.
Step 6: Monitor and Manage Builds
Build History: You can see the status of past builds in Jenkins.
Console Output: Click on a build to view the console output and debug any issues.
Pipeline Visualization: Jenkins provides a visual representation of your pipeline, which can be very helpful.
Step 7: Extend the Pipeline
You can extend your Jenkins pipeline by adding more stages, using environment variables, handling credentials, etc. The pipeline syntax can be tailored to fit the specific requirements of your project, such as integrating Docker, Kubernetes, or other tools.

Example: A More Complex Jenkinsfile
groovy
Copy code
pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/username/repository-name.git'
            }
        }

        stage('Build') {
            steps {
                sh './build.sh'
            }
        }

        stage('Test') {
            steps {
                sh './test.sh'
            }
        }

        stage('Docker Build and Push') {
            steps {
                script {
                    docker.build('username/image-name:latest').push()
                }
            }
        }

        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}
This example includes Docker integration and uses credentials stored in Jenkins for Docker Hub.

Conclusion
By following these steps, you'll have a working Jenkins CI/CD pipeline integrated with GitHub. The pipeline will automatically trigger builds, run tests, and deploy code whenever changes are pushed to the GitHub repository.

