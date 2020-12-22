from subprocess import Popen, PIPE
import subprocess
import properties

def sqlplus_connect():
    connect_string = properties.SQL_PLUS_USERNAME_PASSWORD
    process = Popen(['sqlplus', '-S', connect_string], universal_newlines=True, stdin=subprocess.PIPE,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE)
    print(process.returncode)
    print(process.stdout)
    output, error = process.communicate(input=properties.SQL_PLUS_SCRIPT_PATH)
    #output, error = process.communicate(input="select sys_context('USERENV','SERVER_HOST') from dual;")
