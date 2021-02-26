#!groovy

pipeline {
    agent {
        label 'master'
    }
    stages {
        stage('build') {
            steps {
                sh script: 'docker build -t localhost:5000/app:${BUILD_ID} .', label: 'build docker image'
            }
        }
        stage('upload') {
            steps {
                sh script: 'docker push localhost:5000/app:${BUILD_ID}', label: 'upload docker image to registry'
            }
        }
        stage('deploy') {
            steps {
            // Need to configure remote server install (Docker API? ssh?)
                sh script: 'docker kill app || exit 0', label: 'stop old application'
                sh script: 'docker run --detach --rm --name app -p 9000:9000 localhost:5000/app:${BUILD_ID}', label: 'start new application'
            }

        }
    }
}