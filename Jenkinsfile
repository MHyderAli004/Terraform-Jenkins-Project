pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps { git 'https://github.com/MHyderAli004/Terraform-Jenkins-Project.git' }
        }
        stage('Terraform Init') {
            steps { sh 'terraform init' }
        }
        stage('Format Check') {
            steps { sh 'terraform fmt -check' }
        }
        stage('Validate') {
            steps { sh 'terraform validate' }
        }
        stage('Plan') {
            steps { sh 'terraform plan -out=tfplan' }
        }
        stage('Manual Approval') {
            steps {
                input message: 'Approve Terraform Apply?'
            }
        }
        stage('Apply') {
            steps { sh 'terraform apply tfplan' }
        }
    }
}
