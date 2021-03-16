node {
    load "$JENKINS_HOME/properties.txt"
}
pipeline {
    agent any

    stages {
        stage('build') {
            steps {
               bat "robot --variable USERNAME:${USERNAME} ^"
                "--variable PASSWORD:${PASSWORD} ^"
                "--variable SOURCE_DB:${SOURCE_DB} ^"
                "--variable TARGET_DB:${TARGET_DB} ^"
                "--variable DELPHIXURL:${DELPHIXURL} ^"
                "--variable UNIWEBURL:${UNIWEBURL} ^"
                "--variable CS_OR_HR_SELECT:${CS_OR_HR_CALSTATE_URL} ^"
                "Tests/Post_Clone_Master.robot"
            }
        }
    }
}
