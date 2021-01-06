FROM ubuntu

RUN apt-get update
RUN apt-get install -y python3.7
RUN apt-get install -y python3-pip

# When installing chrome, apt-get install tzdata was being installed which asked for a timezone, issue was solved with this ARG command
ARG DEBIAN_FRONTEND=noninteractive
#RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
#RUN export DEBIAN_FRONTEND=noninteractive
#RUN apt-get -y install tzdata
RUN python3 -m pip install robotframework
RUN python3 -m pip install robotframework-seleniumlibrary
RUN python3 -m  pip install robotframework-databaselibrary
RUN python3 -m  pip install cx_oracle

#Install Chrome
RUN apt-get install -y xvfb
RUN apt-get install -y xvfb 
RUN apt-get install -y zip 
RUN apt-get install -y wget 
RUN apt-get install ca-certificates 
RUN apt-get install -y libnss3-dev libasound2 libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation

# Above code was missing this library
RUN apt-get install -y libgbm1

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb 
RUN rm google-chrome-stable_current_amd64.deb
RUN apt-get install -f

# Have to make sure chromdriver version and matches google-chrome version
RUN wget -N https://chromedriver.storage.googleapis.com/81.0.4044.20/chromedriver_linux64.zip
#RUN wget -N https://chromedriver.storage.googleapis.com/78.0.3904.70/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN chmod +x chromedriver
#RUN cp /chromedriver /usr/local/bin
RUN cp /chromedriver /usr/bin
RUN rm chromedriver_linux64.zip

#RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install
#RUN apt-get install -f


#RUN google-chrome --version

#Instal Chrome driver for testing
#RUN wget https://chromedriver.storage.googleapis.com/78.0.3904.70/chromedriver_linux64.zip -o /usr/local/bin/chromedriver
#RUN unzip -o /usr/local/bin/chromedriver -d /usr/local/bin
#RUN chmod +x /usr/local/bin/chromedriver


#RUN curl https://chromedriver.storage.googleapis.com/2.31/chromedriver_linux32.zip -o /usr/local/bin/chromedriver
#RUN chmod +x /usr/local/bin/chromedriver
#RUN chromedriver
RUN sed -i "s/self._arguments\ =\ \[\]/self._arguments\ =\ \['--no-sandbox',\ '--disable-gpu'\]/" /usr/local/lib/python3.8/dist-packages/selenium/webdriver/chrome/options.py

CMD ["robot", "-d", "/usr/src/project/", "/usr/src/project/Tests/Front_Office.robot"]
