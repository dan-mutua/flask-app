# Flask Application Deployment

This repository contains the source code and deployment configuration for a Flask application. It provides instructions for setting up the application on a Kubernetes cluster using Jenkins for continuous integration and deployment.

## Approach Used

The deployment follows a typical CI/CD (Continuous Integration/Continuous Deployment) approach using the following technologies:

- Flask: Python web framework for developing the application.
- Docker: Containerization platform to package the application and its dependencies.
- Jenkins: CI/CD tool for automating the build, test, and deployment process.
- Kubernetes: Container orchestration platform for managing the deployment and scaling of the application.

The overall workflow is as follows:

1. Push changes to a version control system (e.g., Git).
2. Jenkins detects the changes and triggers a build job.
3. Jenkins builds a Docker image of the application, pushes it to a Docker registry, and tags it with a version.
4. Jenkins deploys the updated code on an EC2 instance in a Kubernetes cluster using the Kubernetes Continuous Deploy Plugin.

## Setup Steps

To set up the application, follow these steps:

### Prerequisites

- Kubernetes cluster is already set up and accessible.
- Jenkins is installed and configured with necessary plugins.
- Docker is installed on the Jenkins server and the Kubernetes cluster.

### Deployment Configuration

1. Clone this repository to your local machine:

   ```shell
   git clone git@github.com:dan-mutua/flask-app.git
2. Update the app-deployment.yaml file with the appropriate configuration for your application.
 - Modify the metadata.name field to specify the name of your deployment.
 - Adjust the container image, ports, and any other configuration specific to your application.
3. Commit and push the changes to your Git repository.

### Jenkins Configuration
1. Create a new Jenkins job.
 - In the Jenkins web interface, click on "New Item" to create a new job.
 - Enter a name for the job and select "Pipeline" as the job type.
 - Under the "Pipeline" section, choose "Pipeline script from SCM" for the Definition.
 - Set the SCM to Git and provide the repository URL of this repository.
 - Save the job configuration.
2. Configure Docker Hub credentials:
 - In Jenkins, go to "Manage Jenkins" > "Manage Credentials".
 - Click on "Global credentials (unrestricted)" > "Add Credentials".
 - Choose "Username with password" as the kind.
 - Enter your Docker Hub username and password, and provide an ID for the credentials.
- Save the credentials.
3. Update Jenkinsfile:
 - Open the Jenkinsfile in this repository and make the following modifications:
 - Replace <EC2_INSTANCE_USERNAME> with the actual username of your EC2 instance in the configure_ec2.yml playbook.
 - Update the credentialsId in the Push stage with the ID of your Docker Hub credentials stored in Jenkins.
 - Save the changes to the Jenkinsfile.
4. Deploy the Jenkins job:
-  Run the Jenkins job manually or trigger it based on your preferred conditions.
 - The pipeline will execute the stages defined in the Jenkinsfile:
 - Build: Builds the Docker image.
 - Test: Runs tests inside the Docker container.
 - Push: Pushes the Docker image to a Docker registry (Docker Hub).
 - Deploy: Applies the Kubernetes deployment and service configurations using kubectl, and runs the configure_ec2.yml Ansible playbook.
 - Save the job configuration.
5. Verify the deployment:
- Once the pipeline completes successfully, verify that the Flask application is deployed and running in your Kubernetes cluster.



### Trigger the Deployment
1. Make changes to your application code and push the changes to the monitored branch in your Git repository.
2. Jenkins will automatically detect the changes and trigger the job.
3. Jenkins will build a new Docker image, push it to the Docker registry, and deploy the updated code on the Kubernetes cluster.
4. Monitor the Jenkins job's console output and the Kubernetes cluster logs for any errors or issues.

### Verify the Deployment
1. Access the application using the appropriate URL or IP address of the Kubernetes cluster.
2. Test the functionality of the deployed application to ensure it is working as expected.
