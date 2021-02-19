from subprocess import Popen, PIPE
import subprocess
import pexpect
import properties


def sqlplus_connect():
    connect_string = properties.SQL_PLUS_USERNAME_PASSWORD
    process = Popen(['sqlplus', '-S', connect_string], universal_newlines=True, stdin=subprocess.PIPE,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE)
    print(process.returncode)
    print(process.stdout)

    output, error = process.communicate(input=properties.SQL_PLUS_SCRIPT_PATH)
    print(output)
    print(error)
    if "ERROR" in output:
        raise Exception("Error in sql script execution")
    else:
        return True


# def change_sysadm_password():
#     child = pexpect.spawn(properties.SSH_TO_APP_DB)
#     child.expect('password: ', timeout=20)
#     child.sendline(properties.PASSWORD)
#
#     child.expect('$')
#     child.sendline('')

    # if "ERROR" in output:
    #     raise Exception("Error in sql script execution")
    # else:
    #     return True

# change_sysadm_password()