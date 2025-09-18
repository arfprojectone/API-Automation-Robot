*** Settings ***
Resource    ../variables/general_library.resource
Resource    ../variables/general_variable.resource
Resource    ../keywords/general_keyword.resource

*** Keywords ***
Create User
    [Arguments]    ${file_path}    ${file_schema}
    ${json_payload}    Get File    ${file_path}

    ${headers}    Create Dictionary    
    ...    Content-Type=application/json
    ...    accept=application/json

    Create Session    create_user    ${BASE_URL}    headers=${headers}
    ${response}    POST On Session    create_user    /user    data=${json_payload}    expected_status=any

    Log To Console    \nStatus: ${response.status_code}
    Log To Console    Response: ${response.json()}\n

    Should Be Equal As Integers    ${response.status_code}    200

    Validate Json Schema    ${response}    ${file_schema}

Successfully Get User by Username
    [Arguments]    ${file_path}    ${file_schema}
    ${json_payload}    Get File    ${file_path}
    ${payload}    Evaluate    json.loads("""${json_payload}""")    json
    ${username}        Set Variable    ${payload["username"]}

    ${headers}    Create Dictionary    
    ...    Content-Type=application/json
    ...    accept=application/json

    Create Session    get_user    ${BASE_URL}    headers=${headers}
    ${response}    GET On Session    get_user    /user/${username}    data=${json_payload}    expected_status=any

    Log To Console    \nStatus: ${response.status_code}
    Log To Console    Response: ${response.json()}\n

    Should Be Equal As Integers    ${response.status_code}    200

    Validate Json Schema    ${response}    ${file_schema}

Failed Get User by Username Not Found
    [Arguments]    ${file_path}    ${file_schema}
    ${json_payload}    Get File    ${file_path}

    ${headers}    Create Dictionary    
    ...    Content-Type=application/json
    ...    accept=application/json

    Create Session    get_user    ${BASE_URL}    headers=${headers}
    ${response}    GET On Session    get_user    /user/ABC   data=${json_payload}    expected_status=any

    Log To Console    \nStatus: ${response.status_code}
    Log To Console    Response: ${response.json()}\n

    Should Be Equal As Integers    ${response.status_code}    404

    Validate Json Schema    ${response}    ${file_schema}

Update User
    [Arguments]    ${file_path}    ${file_schema}
    ${json_payload}    Get File    ${file_path}
    ${payload}    Evaluate    json.loads("""${json_payload}""")    json
    ${username}        Set Variable    ${payload["username"]}

    ${headers}    Create Dictionary    
    ...    Content-Type=application/json
    ...    accept=application/json

    Create Session    update_user    ${BASE_URL}    headers=${headers}
    ${response}    PUT On Session    update_user    /user/${username}    data=${json_payload}    expected_status=any

    Log To Console    \nStatus: ${response.status_code}
    Log To Console    Response: ${response.json()}\n

    Should Be Equal As Integers    ${response.status_code}    200

    Validate Json Schema    ${response}    ${file_schema}