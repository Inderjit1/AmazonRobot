pipeline {
    agent any

    stages {
        stage("build") {
            steps {
                sh 'python3 -m robot.run --outputdir Results Tests/Front_Office.robot'
            }
        }
    }   
}
