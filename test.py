from selenium import webdriver
from selenium.webdriver.firefox import options


try:
    opts = options.Options()

    driver = webdriver.Remote(
        command_executor="http://localhost:4444/wd/hub",
        options=options.Options(),
    )
    print("started 4444")
except:
    print("failed to start 4444")


try:
    opts = options.Options()

    driver = webdriver.Remote(
        command_executor="http://localhost:4445/wd/hub",
        options=options.Options(),
    )
    print("started 4445")
except:
    print("failed to start 4445")


# pip install -U selenium
