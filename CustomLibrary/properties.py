USERNAME = 'inbass92'
PASSWORD = 'Boxing2013'
ID = '010203453'

DELPHIXURL = 'https://delphix801.cms.calstate.edu/login/index.html?from=%2FServer.html'
UNIWEBURL = 'https://uniweb20.calstate.edu/login'
TARGET_DB = 'cbsjdvl'
SOURCE_DB = 'csjprd'

# CS - xpath=//*[@id="test-l-1"]/div[2]/div[1]/div/span/input, HR - xpath=//*[@id="test-l-1"]/div[2]/div[2]/div/span/input
CS_OR_HR_SELECT = '//*[@id="test-l-1"]/div[2]/div[2]/div/span/input'

APP_DB = 'csjappdev.cms.calstate.edu'
DEV_DB = 'csjdev700.sldc.calstate.edu'
APPSERVER_STOP_SCRIPT = 'sudo ps_admin –d cbsjprj –o stop_all'
CHANGE_PASSWORD_SCRIPT = 'sudo db_mgr –d cbsjprj –o chg_pwd'
NEW_SYSADM_PWD = 'Sugardy1'
APPSERVER_START_SCRIPT = 'sudo ps_admin –d cbsjprj –o clr_cache'

SQL_PLUS_USERNAME_PASSWORD = 'SYSADM@CASJSTG/Sugardy3'
SQL_PLUS_SCRIPT_PATH = "@C:\\Users\\010203453\\Documents\\Post Clone Scripts\\CS\\casjstg_clone.sql"

