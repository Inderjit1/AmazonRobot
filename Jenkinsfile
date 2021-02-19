node {
    load "$JENKINS_HOME/.envvars/properties.groovy"
}

pipeline {
    agent any
    
    stages {
        stage("build") {
            steps {
                 sh "python3 -m robot.run  --variables 
                                        USERNAME:${env.USERNAME}
  										PASSWORD:${env.PASSWORD} 
                                        SOURCE_DB: ${env.SOURCE_DB}
                                        TARGET_DB:${env.TARGET_DB}
                                        DELPHIXURL:${env.DELPHIXURL}
                                        UNIWEBURL:${env.UNIWEBURL}
                                        CS_OR_HR_SELECT:${env.CS_OR_HR_CALSTATE_URL}                                            
  							--outputdir Results Tests/Post_Clone_Master.robot"
  
  
                 sh "python3 -m robot.run 	--variables 
                                        USERNAME:${env.USERNAME}
  									    PASSWORD:${env.PASSWORD} 
                                      	APP_DB:${env.APP_DB}
                                        DEV_DB: ${env.DEV_DB}
                                        CHANGE_PASSWORD_SCRIPT: ${env.CHANGE_PASSWORD_SCRIPT}
                                        NEW_SYSADM_PWD: ${env.NEW_SYSADM_PWD}
                                        APPSERVER_START_SCRIPT: ${env.APPSERVER_START_SCRIPT}
                                        APPSERVER_STOP_SCRIPT: ${env.APPSERVER_STOP_SCRIPT}
       						--outputdir Results Tests/Post_Clone_Script.robot"
                            
                sh "python3 -m robot.run  --variables 
                                        PEOPLESOFT_USERNAME:${env.PEOPLESOFT_USERNAME}
                                        PEOPLESOFT_PWD:${env.PEOPLESOFT_PWD}
                                        RULSET_ID:${env.RULSET_ID} 
                                        CS_OR_HR_SELECT:${env.CS_OR_HR_SELECT}
                                --outputdir Results Tests/Post_Clone_Appsian.robot"
                            
                sh "python3 -m robot.run 	--variables 
                                        ID:${env.ID}
										TARGET_DB:${env.TARGET_DB}
  										SECRET_SERVER_PWD: ${env.SECRET_SERVER_PWD}
                                        NEW_SYSADM_PWD: ${env.NEW_SYSADM_PWD}
                                        TSSURL: ${env.TSSURL}
  							--outputdir Results Tests/Post_Clone_Secret_Server.robot"
            }
        }
    }   
}
