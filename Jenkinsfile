pipeline {
    agent any

    stages {

        stage('Checkout Source Code') {
            steps {
                git credentialsId: 'github-ssh',
                    url: 'git@github.com:aashishmalviya2242006-netizen/cloud-infrastructure-automation-platform.git',
                    branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-terraform-creds'
                    ]]) {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('terraform') {
                    sh 'terraform validate'
                }
            }
        }

        stage('tfsec Scan') {
            steps {
                dir('terraform') {
                    sh 'tfsec . || true'
                }
            }
        }

        stage('Trivy Scan') {
            steps {
                dir('terraform') {
                    sh 'trivy config .'
                }
            }
        }

        stage('AWS Authentication') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-terraform-creds'
                ]]) {
                    sh 'aws sts get-caller-identity'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-terraform-creds'
                    ]]) {
                        sh 'terraform plan'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t cloud-automation-app:v1 ./docker-app'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker rm -f cloud-app || true
                docker run -d --name cloud-app -p 8081:80 cloud-automation-app:v1
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-terraform-creds'
                    ]]) {
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }
}
