pipeline {
    agent any

    stages {
        stage('Сборка') {
            steps {
                echo 'Выполняем команды для сборки'
            }
        }
        stage('Тестирование') {
            steps {
                echo 'Тестируем нашу сборку'
            }
        }
        stage('Развертывание') {
            steps {
                echo 'Переносим код в рабочую среду или создаем артефакт'
                checkout([$class: 'GitSCM', branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-cred', url: 'https://github.com/sivin79/docker-test-CI-CD.git']]])
                sh 'ls -la'
                withAWS(credentials:'aws-cred') {
                sh 'aws --version'
                sh 'aws s3 ls'
                }
            }
        }
    }
}