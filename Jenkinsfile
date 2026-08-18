pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "ap-south-2"
        // Use Jenkins Credentials for AWS keys
        AWS_ACCESS_KEY_ID     = credentials('jenkins-terraform-user')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/MHyderAli004/Terraform-Jenkins-Project.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
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

        stage('Manual Approval - Destroy') {
            steps {
                script {
                    timeout(time: 10, unit: 'MINUTES') {
                        input message: "Approve Terraform Destroy?"
                    }
                }
            }
        }

        stage('Destroy') {
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished. Check AWS and S3 state bucket for results.'
        }
    }
}
