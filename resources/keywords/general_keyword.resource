*** Settings ***
Resource    ../../resources/variables/general_library.resource

*** Keywords ***
Suppress Insecure Warning
    Evaluate    __import__('urllib3').disable_warnings()

Wait Before Test
    Sleep    8s

Validate Json Schema
    [Arguments]    ${response}    ${file_schema}
    # json schema validation
    ${schema_validation}    Get File    ${file_schema}
    ${schema}        Evaluate    json.loads($schema_validation)    json
    Evaluate    __import__('jsonschema').validate(${response.json()}, ${schema})