*** Settings ***
Library  String
Library  SeleniumLibrary
*** Variables ***
${JakiBrowser}   chrome
${StronaUrl}    https://www.demoblaze.com/
*** Test Cases ***
Rejestracja test
    ${uzytkownik} =    Generate Random String    8    [LETTERS]
    ${haslo} =    Generate Random String  8    [LETTERS]
    Zarejestrowanie    ${uzytkownik}  ${haslo}
Logowanie test
    Zalogowanie    kolendra    kolendra
Dodanie do koszyka
    Koszykowanie galaxy
    Usuwanie galaxy
    Koszykowanie nexus
    Usuwanie nexus
Skladanie zamowienia
     Koszykowanie galaxy
     Zamawiam    Jan    Polska    Wroclaw    123456789    10    2024
*** Keywords ***
Zarejestrowanie
    [Arguments]  ${uzytkownik}  ${haslo}
    log to console  \nwygenerowany uzytkownik to ${uzytkownik} i haslo ${haslo}
    open browser    ${StronaUrl}    ${JakiBrowser}
    click link    xpath://*[@id="signin2"]
    wait until element is visible    xpath://*[@id="signInModalLabel"]
    input text    id:sign-username    ${uzytkownik}
    sleep    1
    input text    id:sign-password    ${haslo}
    sleep    1
    click button    //*[@id="signInModal"]/div/div/div[3]/button[2]
    sleep    1
    alert should be present    Sign up successful.    accept
    close all browsers
Zalogowanie
    [Arguments]  ${uzytkownik}  ${haslo}
    log to console  \nuzytkownik to ${uzytkownik} i haslo ${haslo}
    open browser    ${StronaUrl}    ${JakiBrowser}
    click link    xpath://*[@id="login2"]
    wait until element is visible    xpath://*[@id="logInModal"]/div/div/div[1]
    input text    id:loginusername   ${uzytkownik}
    sleep    1
    input text    id:loginpassword    ${haslo}
    sleep    1
    click button    xpath://*[@id="logInModal"]/div/div/div[3]/button[2]
    sleep    1
    page should contain    Log out
Koszykowanie galaxy
    click link    xpath://*[@id="navbarExample"]/ul/li[1]/a
    sleep   1
    click element    xpath://*[@id="tbodyid"]/div[1]/div/a
    sleep  1
    click element    xpath://*[@id="tbodyid"]/div[2]/div/a
    alert should be present  Product added.    accept
    click link    xpath://*[@id="navbarExample"]/ul/li[4]/a
    sleep  1
    page should contain element    xpath://*[@id="tbodyid"]/tr/td[2]
Usuwanie galaxy
    click link    xpath://*[@id="navbarExample"]/ul/li[4]/a
    click element    xpath://*[@id="tbodyid"]/tr/td[4]/a
Koszykowanie nexus
    click link    xpath://*[@id="navbarExample"]/ul/li[1]/a
    sleep    1
    click element   xpath://*[@id="tbodyid"]/div[3]/div/a
    sleep    1
    click element    xpath://*[@id="tbodyid"]/div[2]/div/a
    alert should be present  Product added.    accept
    click link    xpath://*[@id="navbarExample"]/ul/li[4]/a
    sleep  1
    page should contain element    xpath://*[@id="tbodyid"]/tr/td[2]
Usuwanie nexus
    click link    xpath://*[@id="navbarExample"]/ul/li[4]/a
    click element    xpath://*[@id="tbodyid"]/tr/td[4]/a
Zamawiam
    [arguments]    ${name}    ${country}    ${city}    ${card}    ${month}    ${year}
    click element    xpath://*[@id="page-wrapper"]/div/div[2]/button
    wait until element is visible    xpath://*[@id="orderModalLabel"]
    input text    id:name    ${name}
    input text    id:country    ${country}
    input text    id:city    ${city}
    input text    id:card    ${card}
    input text    id:month    ${month}
    input text    id:year    ${year}
    click element    xpath://*[@id="orderModal"]/div/div/div[3]/button[2]
    click element    xpath:/html/body/div[10]/div[7]/div/button
