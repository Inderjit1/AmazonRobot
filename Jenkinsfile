node {
    load "$JENKINS_HOME/.envvars/properties.groovy"
}

pipeline {
    agent any
    
    stages {
        stage("build") {
            steps {
               sh "python3 -m robot.run  --variable USERNAME:${env.USERNAME} \
  					--variable PASSWORD:${env.PASSWORD} \
					 --variable SOURCE_DB: ${env.SOURCE_DB} \
					 --variable TARGET_DB:${env.TARGET_DB} \
				         --variable DELPHIXURL:${env.DELPHIXURL} \
					 --variable UNIWEBURL:${env.UNIWEBURL} \
					 --variable CS_OR_HR_SELECT:${env.CS_OR_HR_CALSTATE_URL} \                                           
  				--outputdir Results Tests/Post_Clone_Master.robot"
		    
		sh "python3 -m robot.run --variable USERNAME:${env.USERNAME} \
					 --variable PASSWORD:${env.PASSWORD} \
					 --variable APP_DB:${env.APP_DB} \
					 --variable DEV_DB: ${env.DEV_DB} \
					 --variable CHANGE_PASSWORD_SCRIPT: ${env.CHANGE_PASSWORD_SCRIPT} \
					 --variable NEW_SYSADM_PWD: ${env.NEW_SYSADM_PWD} \
					 --variable APPSERVER_START_SCRIPT: ${env.APPSERVER_START_SCRIPT} \
					 --variable APPSERVER_STOP_SCRIPT: ${env.APPSERVER_STOP_SCRIPT} \
				--outputdir Results Tests/Post_Clone_Script.robot"

		sh "python3 -m robot.run  --variable PEOPLESOFT_USERNAME:${env.PEOPLESOFT_USERNAME} \
					  --variable PEOPLESOFT_PWD:${env.PEOPLESOFT_PWD} \
					  --variable RULSET_ID:${env.RULSET_ID} \
					  --variable CS_OR_HR_SELECT:${env.CS_OR_HR_SELECT} \
				--outputdir Results Tests/Post_Clone_Appsian.robot"

	        sh "python3 -m robot.run --variable ID:${env.ID} \
					 --variable TARGET_DB:${env.TARGET_DB} \
					 --variable SECRET_SERVER_PWD: ${env.SECRET_SERVER_PWD} \
					 --variable NEW_SYSADM_PWD: ${env.NEW_SYSADM_PWD} \
					 --variable TSSURL: ${env.TSSURL} \
				--outputdir Results Tests/Post_Clone_Secret_Server.robot"
            }
        }
    }   
}
