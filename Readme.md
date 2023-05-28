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

2. Configure the job to monitor the branch where your application code resides.

3. Set up the job to perform the following steps:

 - Clone the repository.
 - Build a Docker image from the code and tag it with a version.
 - Push the Docker image to a Docker registry.
 - Deploy the updated code to the Kubernetes cluster using the app-deployment.yaml file.
 - Save the job configuration.

### Trigger the Deployment
1. Make changes to your application code and push the changes to the monitored branch in your Git repository.
2. Jenkins will automatically detect the changes and trigger the job.
3. Jenkins will build a new Docker image, push it to the Docker registry, and deploy the updated code on the Kubernetes cluster.
4. Monitor the Jenkins job's console output and the Kubernetes cluster logs for any errors or issues.

### Verify the Deployment
1. Access the application using the appropriate URL or IP address of the Kubernetes cluster.
2. Test the functionality of the deployed application to ensure it is working as expected.