from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from time import sleep
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import properties


class Polling:
    def __init__(self):
        pass

    def poll_status(self):
        driver = webdriver.Chrome()
        driver.get('https://hsjdev.cms.calstate.edu/psp/HBSJSTG/?cmd=login&languageCd=ENG&')
        username = driver.find_element_by_id('userid')
        password = driver.find_element_by_id('pwd')

        username.send_keys(properties.USERNAME)
        password.send_keys(properties.PASSWORD)
        password.send_keys(Keys.RETURN)

        element = driver.find_element_by_xpath('//*[@id="pthnavbca_PORTAL_ROOT_OBJECT"]')
        element.click()

        sjsu_human_resources_link = driver.find_element_by_xpath('//*[@id="fldra_SJ_HR_CUSTOM_MENU"]')
        sjsu_human_resources_link.click()

        try:
            WebDriverWait(driver, 2).until(
                EC.presence_of_element_located((By.XPATH, '//*[@id="fldra_SJ_HR_ORG_DEVELOPMENT"]'))
            ).click()

            WebDriverWait(driver, 2).until(
                EC.presence_of_element_located((By.XPATH, '//*[@id="crefli_SJ_RUN_SJHR010_PG"]/a'))
            ).click()

            frame = WebDriverWait(driver, 2).until(
                EC.presence_of_element_located((By.XPATH, '//*[@id="ptifrmtgtframe"]'))
            )
            driver.switch_to.frame(frame)

            WebDriverWait(driver, 2).until(
                EC.presence_of_element_located((By.XPATH, '//*[@id="ICTAB_1"]'))
            ).click()

            WebDriverWait(driver, 4).until(
                EC.presence_of_element_located(
                    (By.XPATH, '/html/body/form/div[5]/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]/div/input'))
            )

            # Enter in run control id
            add_button = driver.find_element_by_xpath('//*[@id="PRCSRUNCNTL_RUN_CNTL_ID"]')
            add_button.send_keys(properties.RUN_CONTROL_ID)
            add_button.send_keys(Keys.RETURN)

            # Set values to run the report
            WebDriverWait(driver, 2).until(
                EC.presence_of_element_located((By.XPATH, '//*[@id="RUN_CNTL_HR_SETID"]'))
            )

            driver.find_element_by_xpath('//*[@id="RUN_CNTL_HR_SETID"]').send_keys(properties.SET_ID)
            driver.find_element_by_xpath('//*[@id="RUN_CNTL_HR_DEPTID"]').send_keys(properties.DEPT)
            radiobutton = driver.find_element_by_xpath('//*[@id="RUN_CNTL_HR_NEW_SCENARIO$8$"]')

            while not radiobutton.is_selected():
                radiobutton.click()

            driver.find_element_by_xpath('//*[@id="PRCSRQSTDLG_WRK_LOADPRCSRQSTDLGPB"]').click()

            # Click on SQR Report and Run
            WebDriverWait(driver, 2).until(
                EC.presence_of_element_located((By.XPATH, '//*[@id="PRCSRQSTDLG_WRK_SELECT_FLAG$1"]'))
            )

            driver.find_element_by_xpath('//*[@id="PRCSRQSTDLG_WRK_SELECT_FLAG$1"]').click()
            driver.find_element_by_xpath('//*[@id="#ICSave"]').click()

            WebDriverWait(driver, 2).until(
                EC.presence_of_element_located((By.XPATH, '//*[@id="PRCSRQSTDLG_WRK_LOADPRCSMONITORPB"]'))
            ).click()

            WebDriverWait(driver, 4).until(
                EC.presence_of_element_located((By.XPATH, '//*[@id="win0divPMN_PRCSLISTGP$0"]/table/tbody/tr/td[1]'))
            ).click()
            distribution_status = driver.find_element_by_xpath('//*[@id="PMN_PRCSLIST_DISTSTATUS$0"]')
            print("Test element is: ", distribution_status.text)
            while distribution_status.text == 'N/A':
                driver.find_element_by_xpath('//*[@id="REFRESH_BTN"]').click()

                sleep(5)
                distribution_status = driver.find_element_by_xpath('//*[@id="PMN_PRCSLIST_DISTSTATUS$0"]')

            run_status = driver.find_element_by_xpath('//*[@id="PMN_PRCSLIST_RUNSTATUSDESCR$0"]')
            print("Run status is: ", run_status.text)
            if run_status.text == 'Success':
                return True
            else:
                raise Exception("Report was not run successfully")

        finally:
            driver.quit()
            print("Done")


test = Polling()
test.poll_status()
