pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Check out your source code from the repository
                checkout scm
            }
        }
        stage('Build and Test') {
            steps {
                // Build and test your application
                sh 'npm install'
                sh 'npm test'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build Docker images for frontend and backend
                sh 'docker build -t my-frontend ./frontend'
                sh 'docker build -t my-backend ./backend'
            }
        }
        stage('Deploy to AWS') {
            steps {
                // Use Terraform to deploy infrastructure
                sh 'terraform init'
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
