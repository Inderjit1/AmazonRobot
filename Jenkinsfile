node {
    load "$JENKINS_HOME/properties.txt"
}
pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                "robot --variable USERNAME:${USERNAME} ^"
                "--variable PASSWORD:${PASSWORD} ^"
                "--variable SOURCE_DB:${SOURCE_DB} ^"
                "--variable TARGET_DB:${TARGET_DB} ^"
                "--variable DELPHIXURL:${DELPHIXURL} ^"
                "--variable UNIWEBURL:${UNIWEBURL} ^"
                "--variable CS_OR_HR_SELECT:${CS_OR_HR_CALSTATE_URL} ^"
                "Tests/Post_Clone_Master.robot"

                "robot --variable USERNAME:${USERNAME} ^"
                "--variable  PASSWORD:${PASSWORD} ^"
                "--variable  APP_DB:${APP_DB} ^"
                "--variable  DEV_DB:${DEV_DB} ^"
                "--variable  CHANGE_PASSWORD_SCRIPT:${CHANGE_PASSWORD_SCRIPT} ^"
                "--variable  NEW_SYSADM_PWD:${new_sysadm_pwd} ^"
                "--variable  APPSERVER_START_SCRIPT:${APPSERVER_START_SCRIPT} ^"
                "--variable  APPSERVER_STOP_SCRIPT:${APPSERVER_STOP_SCRIPT} ^"
                "--variable WEBSERVER_RECYCLE_SCRIPT:${WEBSERVER_RECYCLE_SCRIPT} ^"
                "Tests/Post_Clone_Script.robot"

                "robot --variable PEOPLESOFT_USERNAME:${PEOPLESOFT_USERNAME} ^"
                "--variable  PEOPLESOFT_PWD:${PEOPLESOFT_PWD} ^"
                "--variable  RULSET_ID:${RULSET_ID} ^"
                "--variable  CS_OR_HR_SELECT:${CS_OR_HR_CALSTATE_URL} ^"
                "Tests/Post_Clone_Appsian.robot"

                "robot --variable ID:${ID} ^"
                "--variable SECRET_SERVER_PWD:${SECRET_SERVER_PWD} ^"
                "--variable NEW_SYSADM_PWD: ${NEW_SYSADM_PWD} ^"
                "--variable TSSURL: ${TSSURL} ^"
                "Tests/Post_Clone_Secret_Server.robot"
            }
        }
    }
}
