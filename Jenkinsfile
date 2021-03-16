node {
   props = readProperties file:'CustomLibrary/properties.py'
   USERNAME = props['USERNAME']
   PASSWORD = props['PASSWORD']
}

pipeline {
    agent any
    
    stages {
        stage("Test read from file"){
            steps{
                echo "${USERNAME}"
                echo "${PASSWORD}"
            }
        }
       stage("Test run on Windows"){
            steps{
                bat "robot -d results Tests/Front_Office.robot"
                bat "${PASSWORD}"
            }
        }
      /*  stage("build") {
            steps {
                sh 'python3 -m robot.run --outputdir Results Tests/Front_Office.robot'
            }
        }*/
    }   
}
