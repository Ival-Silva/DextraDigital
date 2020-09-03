*** Settings ***
Library             SeleniumLibrary
Test Setup          Abrir navegador

*** Variables ***
${BROWSER}    chrome

*** Test Case ***
PARTE 1
    Acessar a página home do site
    Mouse Over       xpath=//*[@id="h_user"]/span[1]/div
    Sleep            1
    Click Element    xpath=//*[@id="h_user"]/span[2]/div/a[2]
    Input Text       xpath=//*[@id="email-input"]      teste@hotmail.com
    Input Text       xpath=//*[@id="password-input"]   12 
    Input Text       xpath=//*[@id="cpf-input"]        123456
    Input Text       xpath=//*[@id="name-input"]       teste
    Input Text       xpath=//*[@id="birthday-input"]   26121984
    Click Element    xpath=//*[@id="gender"]/div[1]/label
    Input Text       xpath=//*[@id="phone-input"]      4133334444
    Click Element    xpath=//*[@id="root"]/div/div[2]/form/button
    Page Should Contain Element       xpath=//*[@id="email"]/div
    Page Should Contain Element       xpath=//*[@id="password"]/div/span
    Close Browser

Validacao CPF invalido
    Acessar a página home do site
    Mouse Over       xpath=//*[@id="h_user"]/span[1]/div
    Sleep            1
    Click Element    xpath=//*[@id="h_user"]/span[2]/div/a[2]
    Input Text       xpath=//*[@id="email-input"]      teste03092020@hotmail.com
    Input Text       xpath=//*[@id="password-input"]   486930 
    Input Text       xpath=//*[@id="cpf-input"]        12345
    Input Text       xpath=//*[@id="name-input"]       teste sobre nome
    Input Text       xpath=//*[@id="birthday-input"]   26121984
    Click Element    xpath=//*[@id="gender"]/div[1]/label
    Input Text       xpath=//*[@id="phone-input"]      4133334444
    Click Element    xpath=//*[@id="root"]/div/div[2]/form/button
    Page Should Contain Element       xpath=//*[@id="cpf"]/div 
    Close Browser

PARTE 2   
    Acessar a página home do site
    Mouse Over       xpath=//*[@id="h_user"]/span[1]/div
    Sleep            1
    Click Element    xpath=//*[@id="h_user"]/span[2]/div/a[2]
    Sleep            1
    Input Text       xpath=//*[@id="email-input"]      teste03092020@hotmail.com
    Input Text       xpath=//*[@id="password-input"]   486930 
    Input Text       xpath=//*[@id="cpf-input"]        47839227058
    Input Text       xpath=//*[@id="name-input"]       teste sobre nome
    Input Text       xpath=//*[@id="birthday-input"]   26121984
    Click Element    xpath=//*[@id="gender"]/div[1]/label
    Input Text       xpath=//*[@id="phone-input"]      4133334444
    Click Element    xpath=//*[@id="root"]/div/div[2]/form/button
    Page Should Contain Element       xpath=//*[@id="email"]/div
    Page Should Contain Element       xpath=//*[@id="password"]/div/span

# busca pelo texto "Moto G6"
    Input Text      //*[@id="h_search-input"]       Moto G6
    Click Element    xpath=//*[@id="h_search-btn"]/svg
 
# Adicione dois produtos a sua cesta.    
    Click Element    xpath=//*[@id="content-middle"]/div[6]/div/div/div/div[1]/div[1]/div/div[2]/a/section/div[2]/div[1]/h2
    Input Text      //*[@id="freight-field"]        83050140
    Sleep           1
    Click Element    xpath=//*[@id="btn-continue"]/div
    Sleep           1
    Click Element    xpath//*[@id="icon-plus"]


# Valide que o total da compra é inferior a 5 mil reais.
    Page Should Contain Element       //*[@id="app"]/section/section/div[1]/div[1]/section/ul/li/div[1]/div[5]/p

# Valide que a compra pode ser dividida em até 10x sem juros.
    Page Should Contain Element       //*[@id="app"]/section/section/div[2]/div/div[1]/div

    Close Browser

*** Keywords ***
Abrir navegador
    Open Browser    about:blank   ${BROWSER}

Fechar navegador
    Close Browser

Acessar a página home do site
    Go To    https://www.americanas.com.br/
