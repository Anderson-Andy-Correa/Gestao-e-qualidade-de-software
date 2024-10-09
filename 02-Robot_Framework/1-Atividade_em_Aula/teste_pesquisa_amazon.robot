*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br
${BROWSER}    chrome
${PRODUCT}    notebook

*** Test Cases ***
Search a product on amazon
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=twotabsearchtextbox    ${PRODUCT}
    Click Button    id=nav-search-submit-button
    Page Should Contain    ${PRODUCT}
    Close Browser