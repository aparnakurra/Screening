pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        DOCKER_IMAGE = 'sample_app'
        ECR_REPO_URI = 'ECR_REPO_URI'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'git_url'
            }
        }

        stage('Build') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:${env.BUILD_ID}")
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'npm install'
                        sh 'npm test'
                    }
                }
            }
        }

        stage('Security Scan') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'npm install -g retire'
                        sh 'retire'
                    }
                }
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    withAWS(region: "${AWS_REGION}", credentials: 'aws-credentials') {
                        sh '''
                            $(aws ecr get-login --no-include-email)
                            docker tag ${DOCKER_IMAGE}:${env.BUILD_ID} ${ECR_REPO_URI}:${env.BUILD_ID}
                            docker push ${ECR_REPO_URI}:${env.BUILD_ID}
                        '''
                    }
                }
            }
        }

        stage('Deploy to ECS') {
            steps {
                script {
                    withAWS(region: "${AWS_REGION}", credentials: 'aws-credentials') {
                        sh '''
                            aws ecs update-service --cluster your-cluster-name --service your-service-name --force-new-deployment
                        '''
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
