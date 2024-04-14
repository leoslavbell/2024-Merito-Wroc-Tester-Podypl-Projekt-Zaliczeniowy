*** Settings ***
Library    SeleniumLibrary
Resource   ./keywords.robot
Suite Setup     Otworz Strone Logowania
Suite Teardown  Zamknij Browsers
Test Template   Nieskuteczne logowanie
*** Test Cases ***
Dobry Uzytkownik Puste Haslo    kolendra    ${Empty}
Dobry Uzytkownik Zle Haslo    kolendra    kolega
Zly Uzytkownik Dobre Haslo    kolega    kolendra
Zly Uzytkownik Puste Haslo    kolega    ${Empty}
Zly Uzytkownik Zle Haslo    kolega    kolega
*** Keywords ***
Nieskuteczne logowanie
    [Arguments]    ${Uzytkownik}    ${Haslo}
    Wpisz Uzytkownika    ${Uzytkownik}
    Wpisz Haslo    ${Haslo}
    Wcisnij Login
    Sprawdzam czy okno jest Log in
