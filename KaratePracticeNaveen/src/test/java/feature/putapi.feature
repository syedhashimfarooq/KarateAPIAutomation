Feature: Update User using PUTT API

Background: 
* url 'https://gorest.co.in'
* def requestPayload = 
"""
{
    "name": "dicker"
}

"""

Scenario: Update a User with Put call

Given path '/public/v2/users/7578976'
And request requestPayload
And header Authorization = 'Bearer ' + tokenID
When method put
Then status 200
And match $.id == '#present'
And match $.name == 'dicker'