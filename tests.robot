*** Settings ***
Documentation     A test suite containing tests for leinadjmc.com
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Site
Suite Teardown    Close Browser
Test Setup        Go To Index
Resource          resource.robot

*** Test Cases ***
Website Displays
    Site should be open

Anomali Hyperlink
    Click the Anomali hyperlink
    Title Should Be       ${ANOMALI TITLE}
    Location Should Be    ${ANOMALI URL}


Resume Page Loads
    Click the CV hyperlink
    Title Should Be       ${RESUME TITLE}
    Location Should Be    ${RESUME URL}

Twitter hyperlink
    Click the twitter Image
    Location Should Be   ${TWITTER URL}

# for linkedin hyperlink tests I used 'location should contain'
# over 'location should be' as LinkedIn.com prompts you to sign into
# an account before you can view other accounts, therefore the URL is different
LinkedIn hyperlink
    Click the Linkedin Image
    Location Should Contain   ${LINKEDIN IMG}

Github hyperlink
    Click the Github Image
    Location Should Be   ${GITHUB URL}


[Teardown]    Close Browser
