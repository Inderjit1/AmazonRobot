USERNAME = 'inbass92'
PASSWORD = 'Hahaha123!'

ID = '010203453'
SECRET_SERVER_PWD = "Boxing2015!"

PEOPLESOFT_USERNAME = "SJIBASSI"
PEOPLESOFT_PWD = "Hahaha123!"
# SECRET_SERVER_DB = "CASJDVL"

TARGET_DB = "CASJPRJ"
SOURCE_DB = "csjprd"

DELPHIXURL = 'https://delphix801.cms.calstate.edu/login/index.html?from=%2FServer.html'
UNIWEBURL = 'https://uniweb20.calstate.edu/login'
TSSURL    = 'https://secretserver.sjsu.edu/Login.aspx?ReturnUrl=%2f'
CS_OR_HR_CALSTATE_URL = f"https://csjdev.cs.calstate.edu/psp/{TARGET_DB}/?cmd=login&languageCd=ENG&"

# CS - xpath=//*[@id="test-l-1"]/div[2]/div[1]/div/span/input, HR - xpath=//*[@id="test-l-1"]/div[2]/div[2]/div/span/input
CS_OR_HR_SELECT = 'xpath=//*[@id="test-l-1"]/div[2]/div[1]/div/span/input'

APP_DB = 'csjappdev.cms.calstate.edu'
DEV_DB = 'csjdev700.sldc.calstate.edu'
NEW_SYSADM_PWD = 'Sugardy1'
CHANGE_PASSWORD_SCRIPT = f'echo {NEW_SYSADM_PWD} | sudo -S db_mgr –d {TARGET_DB.lower()}  –o chg_pwd'
APPSERVER_START_SCRIPT = f'sudo ps_admin –d {TARGET_DB.lower()} –o clr_cache'
APPSERVER_STOP_SCRIPT = f'sudo ps_admin –d {TARGET_DB.lower()} –o stop_all'
WEBSERVER_RECYCLE_SCRIPT = f'sudo ps_admin –d {TARGET_DB.lower()} – o recycle_pia_#'

RULSET_ID = 'SJ_FW_RULESET_STG'

SQL_PLUS_USERNAME_PASSWORD = 'SYSADM@CASJSTG/Sugardy3'
SQL_PLUS_SCRIPT_PATH = "@C:\\Users\\010203453\\Documents\\Post Clone Scripts\\CS\\casjstg_clone.sql"