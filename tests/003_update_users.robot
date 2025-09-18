*** Settings ***
Resource    ../resources/variables/general_library.resource
Resource    ../resources/variables/general_variable.resource
Resource    ../resources/keywords/general_keyword.resource
Resource    ../resources/keywords/user_keyword.resource

Suite Setup    Suppress Insecure Warning
# Test Setup     Wait Before Test

*** Test Cases ***
Successfully Update User
    Update User  
    ...    data/schema/update_user/payload_update_user.json    
    ...    data/schema/update_user/schema-200.json