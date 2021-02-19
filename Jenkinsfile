node {
    load "$JENKINS_HOME/.envvars/properties.groovy"
}

pipeline {
    agent any
    
    stages {
        stage("build") {
            steps {
                 sh "python3 -m robot.run  --variables 
                                        USERNAME:${params.user_name}
  										PASSWORD:${params.pwd} 
                                        SOURCE_DB: ${params.source_db}
                                        TARGET_DB:${params.target_db}
                                        DELPHIXURL:${params.delphix_url}
                                        UNIWEBURL:${params.uniweb_url}
                                        CS_OR_HR_SELECT:${params.cs_or_hr}                                            
  							--outputdir Results Tests/Post_Clone_Master.robot"
  
  
                 sh "python3 -m robot.run 	--variables 
                                        USERNAME:${params.user_name}
  									    PASSWORD:${params.pwd} 
                                      	APP_DB:${params.app_db}
                                        DEV_DB: ${params.dev_db}
                                        CHANGE_PASSWORD_SCRIPT: ${params.change_pwd_script}
                                        NEW_SYSADM_PWD: ${params.new_sysadm_pwd}
                                        APPSERVER_START_SCRIPT: ${params.appserver_start}
                                        APPSERVER_STOP_SCRIPT: ${params.appserver_stop}
       						--outputdir Results Tests/Post_Clone_Script.robot"
                            
                sh "python3 -m robot.run  --variables 
                                        PEOPLESOFT_USERNAME:${params.peoplesoft_username}
                                        PEOPLESOFT_PWD:${params.peoplesoft_pwd}
                                        RULSET_ID:${params.ruleset_id} 
                                        CS_OR_HR_SELECT:${params.cs_or_hr}
                                --outputdir Results Tests/Post_Clone_Appsian.robot"
                            
                sh "python3 -m robot.run 	--variables 
                                        ID:${params.id}
  										 SECRET_SERVER_PWD: ${params.secret_server_pwd}
                                        SECRET_SERVER_DB: ${params.secret_server_db}
                                        NEW_SYSADM_PWD: ${params.new_sysadm_pwd}
                                        TSSURL: ${params.tss_url}
  							--outputdir Results Tests/Post_Clone_Secret_Server.robot"
            }
        }
    }   
}
