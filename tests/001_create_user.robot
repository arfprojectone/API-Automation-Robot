*** Settings ***
Resource    ../resources/variables/general_library.resource
Resource    ../resources/variables/general_variable.resource
Resource    ../resources/keywords/general_keyword.resource
Resource    ../resources/keywords/user_keyword.resource

Suite Setup    Suppress Insecure Warning

*** Test Cases ***
Successfully Create User    
    Create User    
    ...    data/schema/create_user/payload_create_user.json    
    ...    data/schema/create_user/schema-200.json