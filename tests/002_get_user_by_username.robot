*** Settings ***
Resource    ../resources/variables/general_library.resource
Resource    ../resources/variables/general_variable.resource
Resource    ../resources/keywords/general_keyword.resource
Resource    ../resources/keywords/user_keyword.resource

Suite Setup    Suppress Insecure Warning
# Test Setup     Wait Before Test

*** Test Cases ***
Successfully Get User by Username
    Successfully Get User by Username
    ...    data/schema/get_user/payload_get_user_by_username.json    
    ...    data/schema/get_user/schema-200.json
    
Failed Get User by Username Not Found
    Failed Get User by Username Not Found
    ...    data/schema/get_user/payload_get_user_by_username.json    
    ...    data/schema/get_user/schema-404.json