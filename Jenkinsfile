pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "ap-south-2"
        // Use Jenkins Credentials for AWS keys
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/YOUR-USERNAME/terraform-jenkins-project.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init -backend-config=backend.tf'
            }
        }

        stage('Format Check') {
            steps {
                sh 'terraform fmt -check'
            }
        }

        stage('Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Manual Approval') {
            steps {
                script {
                    timeout(time: 10, unit: 'MINUTES') {
                        input message: "Approve Terraform Apply?"
                    }
                }
            }
        }

        stage('Apply') {
            steps {
                sh 'terraform apply tfplan'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished. Check AWS and S3 state bucket for results.'
        }
    }
}
