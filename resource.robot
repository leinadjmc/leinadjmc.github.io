*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${INDEX TITLE}    leinadjmc
${ANOMALI TITLE}  Threat Intelligence Platform | Anomali
${RESUME TITLE}   danielcraigresume
${BROWSER}        Chrome
${DELAY}          0
${INDEX URL}      http://leinadjmc.com/
${ANOMALI URL}    https://www.anomali.com/
${RESUME URL}     ${INDEX URL}resume.html
${ANOMALI LINK}   Anomali
${RESUME LINK}    here
${TWITTER IMG}    twitter
${TWITTER URL}    https://twitter.com/leinadjmc
${LINKEDIN IMG}   linkedin
${LINKEDIN URL}   https://www.linkedin.com/in/leinadjmc/
${GITHUB IMG}     github
${GITHUB URL}     https://github.com/leinadjmc
${WIDTH}          100
${HEIGHT}         600

*** Keywords ***
Open Browser To Site
    Open Browser         ${INDEX URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed   ${DELAY}
    Site Should Be Open

Site should be open
    Title Should Be      ${INDEX TITLE}
    Location Should Be   ${INDEX URL}

Go To Index
    Go To                ${INDEX URL}
    Site Should Be Open

Click the Anomali hyperlink
    Site should be open
    Click Link            ${ANOMALI LINK}

Click the CV hyperlink
    Site should be open
    Click Link           ${RESUME LINK}
    Test that PDF is displayed

Test that PDF is displayed
    Location Should Be    ${RESUME URL}
    Page should contain element   name:pdfview

Click the Twitter Image
    Site should be Open
    Click Image   name:${TWITTER IMG}

Click the Linkedin Image
    Site should be Open
    Click Image   name:${LINKEDIN IMG}

Click the Github Image
    Site should be Open
    Click Image   name:${GITHUB IMG}
