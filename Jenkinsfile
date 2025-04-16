pipeline {
    agent any

    environment {
        FLASK_APP = "app.py"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git credentialsId: 'github-creds', url: 'https://github.com/sathwik789/Docker_Project'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip3 install -r requirements.txt'
            }
        }

        stage('Run App') {
            steps {
                sh 'nohup python3 app.py > flask.log 2>&1 &'
                sleep time: 10, unit: 'SECONDS'
            }
        }
    }
}
