*** Settings ***
Library    SeleniumLibrary
Library    String
*** Variables ***
${StronaUrl}    https://www.demoblaze.com/
${JakiBrowser}    chrome
*** Keywords ***
Zamknij Browsers
    close all browsers
Otworz Strone Logowania
    open browser    ${StronaUrl}    ${JakiBrowser}
    click link    xpath://*[@id="login2"]
    wait until element is visible    xpath://*[@id="logInModal"]/div/div/div[1]
Wpisz Uzytkownika
    [Arguments]    ${Uzytkownik}
    input text    id:loginusername   ${Uzytkownik}
Wpisz Haslo
    [Arguments]   ${Haslo}
    input text    id:loginpassword    ${Haslo}
Wcisnij Login
    click button    xpath://*[@id="logInModal"]/div/div/div[3]/button[2]
    handle alert    ACCEPT
Sprawdzam czy okno jest Log in
    page should contain element    xpath://*[@id="logInModal"]/div/div/div[3]/button[2]

