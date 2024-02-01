pipeline {
    agent any

    environment {
        // AWS credentials
        AWS_ACCESS_KEY_ID = credentials('iremmdogann')
        AWS_SECRET_ACCESS_KEY = credentials('U9YXk8-gByZ=Pj=')
        AWS_DEFAULT_REGION = 'us-east-1'
        // Docker Registry credentials
        DOCKER_REGISTRY_CREDENTIALS = 'docker-registry-credentials'
        // Docker image details
        DOCKER_IMAGE = 'bulut_bilisim2'
        DOCKERFILE_PATH = './Dockerfile'
        // ECR details
        ECR_REGISTRY = '637423627328.dkr.ecr.us-east-1.amazonaws.com'
        ECR_REPO_NAME = 'bulut_bilisim2'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE, "-f ${DOCKERFILE_PATH} .")
                }
            }
        }

        stage('Push Docker Image to ECR') {
            steps {
                script {
                    docker.withRegistry(ECR_REGISTRY, DOCKER_REGISTRY_CREDENTIALS) {
                        docker.image(DOCKER_IMAGE).push("${ECR_REGISTRY}/${ECR_REPO_NAME}")
                    }
                }
            }
        }
    }
}
