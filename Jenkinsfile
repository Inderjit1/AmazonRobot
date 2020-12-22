pipeline {

   agent any

   stages {
      stage ('Run Tests'){
          steps{
              script{
                  python3 -m robot.run --outputdir Results Tests/Post_Clone_Master.robot
                  python3 -m robot.run --outputdir Results Tests/Post_Clone_Script.robot
              }
          }
        }
   }
}
