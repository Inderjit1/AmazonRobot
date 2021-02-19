from subprocess import Popen, PIPE
import subprocess

def sqlplus_connect():
    connect_string = "SYSADM@CASJSTG/Sugardy7"
    process = Popen(['sqlplus', '-S', connect_string], shell=True, universal_newlines=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                             stderr=subprocess.PIPE)

    print(f'Returncode is: {process.returncode}')
    print(f'STDOUT is: {process.stdout}')
    output, error = process.communicate(input="select sys_context('USERENV','SERVER_HOSTT') from dual;")
    print(f'Output is: ${output}')
    print(f'Error is: ${error}')
    if "ERROR" in output:
        raise Exception("Error in sql script execution")
    else:
        return True

