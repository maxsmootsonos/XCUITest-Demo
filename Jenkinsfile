pipeline {
    agent any
    stages {
        stage("Build/Test") {
            steps {
                sh "./build.sh"
            }
        }
        stage("Process Logs") {
            steps {
            sh "./process_results.sh"
            }
        }
        
    }
}