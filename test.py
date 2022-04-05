#!/Users/rudolfszvejs/tmp/fffake/venv/bin/python

from selenium import webdriver

import time

from selenium.webdriver.firefox import options


opts = options.Options()

# opts.add_argument()


driver = webdriver.Remote(
    command_executor="http://localhost:4444/wd/hub", options=options.Options()
)

time.sleep(30)

# https://webcamtests.com/

driver.get("https://webcamtests.com/")

time.sleep(10)


driver.close()
driver.quit()
