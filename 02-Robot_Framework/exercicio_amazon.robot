*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br
${BROWSER}    chrome
${PRODUTO}    tvDasCasasBahia

*** Keywords ***
Search for tvDasCasasBahia on amazon
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=twotabsearchtextbox    ${PRODUTO}
    Click Button    id=nav-search-submit-button

*** Test Cases ***
Return a answer for the test
    Search for tvDasCasasBahia on amazon
    Page Should Contain    ${PRODUTO}
    Close Browser
