# Automated-Multi-Tier-Web-Application-Deployment-on-AWS
Automated multi-tier web application deployment on AWS involves setting up a scalable and reliable infrastructure using services like AWS Virtual Private Cloud (VPC), Linux-based EC2 instances, Terraform for infrastructure as code, and AWS CloudFormation for managing the application stack.
## Introduction
This project aims to simplify the deployment of multi-tier web applications on AWS by leveraging Infrastructure as Code principles with Terraform and containerization using Docker. The provided code automates the provisioning of the following components:

### Frontend Web Servers: 
>> Docker containers running a web server (e.g., Nginx, Apache) serving the frontend application.
### Application Servers: 
>> Docker containers running the backend application logic and serving API requests.
### Database Server: 
>> Amazon RDS instance to store application data securely.
### Load Balancer: 
>> AWS Elastic Load Balancer (ELB) for distributing incoming traffic to frontend and application servers. 
### VPC, Subnets, Security Groups: 
>> Networking infrastructure to isolate and secure components.
### Auto Scaling: 
>> Automatic scaling of frontend and application servers based on traffic load.

## Features

### Automation: 
>> Easily deploy and manage a multi-tier web application on AWS without manual configuration.
### Scalability: 
>> Automatically scale frontend and application servers to handle varying workloads.
### Security: 
>> Implement security best practices with isolated VPC, security groups, and IAM roles.
### Containerization: 
>> Utilize Docker containers for consistent application deployment.
### Cost Efficiency: 
>> Only pay for the resources you use, with the ability to scale down during low traffic.
### Customizable: 
>> Adjust the configuration to fit your specific application requirements.

## Prerequisites
Before getting started, make sure you have the following prerequisites:

- AWS Account: You should have an AWS account with the necessary permissions to create resources like EC2 instances, RDS databases, and VPC components.
- Terraform: Install Terraform on your local machine. You can download it here.
- Docker: Install Docker on your local machine. You can download it here.
- AWS CLI: Configure AWS CLI with the necessary credentials and default region.

# Getting Started
Follow these steps to get started with deploying your multi-tier web application on AWS:

### Infrastructure Provisioning
- Navigate to the infrastructure/ directory.
- Configure your AWS credentials using aws configure if not already done.
```
aws configure
```
Run terraform init and terraform apply to provision the infrastructure.
```
terraform init
```
```
terraform apply
```
Deploy the infrastructure to AWS:
```
terraform apply
```
### Architecture
- The architecture of the multi-tier web application deployment on AWS consists of frontend web servers, application servers, a database server, and an Elastic Load Balancer (ELB) to distribute incoming traffic. The Virtual Private Cloud (VPC) isolates the environment, and security groups control access to resources.Deploy Docker Containers
- You'll need a method to deploy your Docker containers to the EC2 instance. You can use tools like Docker Compose, Kubernetes, or a simple docker run command as shown in the user_data script.
```
docker run
```
### Configure Networking and Security
You'll likely need to set up security groups, networking (VPC, subnets, etc.), and configure DNS or load balancers depending on your application's architecture.
### Automate Deployment
Integrating Terraform with a CI/CD tool like Jenkins is a powerful way to automate the entire deployment pipeline, including code testing, building Docker images, and deploying them to AWS. Here's a step-by-step guide on how to set up such an automated deployment pipeline:

### Application Dockerization
* Create a Dockerfile in the root directory for your web application. Refer to the provided example for guidance.
* Build the Docker image using docker build -t my-web-app-image .
```
docker build -t my-web-app-image .
```
```
docker images
```
```
docker run -d -p 8080:80 my-web-app-image
```
* When you're done testing your Docker container, you can stop and remove it:
```
docker stop <container_id> #enter the your docker container_id
```
```
docker rm <container_id> #enter the your docker container_id
```
### Setting Up Jenkins
* Run Jenkins either on an EC2 instance or in a Docker container as described in the project documentation.
```
docker run -d -u root -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --name jenkins jenkins/jenkins:lts
```
* Configure Jenkins with the necessary plugins (Git, Docker, AWS).
* Set up credentials in Jenkins for Docker Hub and AWS as required.

### CI/CD Pipeline
* Create a Jenkins pipeline job in the Jenkins web interface.
  >> - In the Jenkins web interface, click on "New Item" to create a new pipeline job.
  >> - Enter a name for your pipeline job and choose the "Pipeline" option.
  >> - Click "OK" to create the job.
* Configure the pipeline source to connect to your Git repository.
  >> - In the pipeline configuration, scroll down to the "Pipeline" section.
  >> -  Choose the "Pipeline script from SCM" option.
  >> -  Select your source code management system (e.g., Git).
  >> - Provide the repository URL and credentials if required.
  >> - Specify the branch to build (e.g., main or master).
* Define the pipeline stages as described in the project documentation, and adjust the Jenkinsfile accordingly.


#### Conclusion 
+ The Automated Multi Tier Website Using AWS. Deployed ...
  
