Feature: Create User using POST API

Background: 
* url 'https://gorest.co.in'
* def requestPayload = 
"""
{
    "name": "dick",
    "email": "dick4@gmail.com",
    "gender": "male",
    "status": "active"
}

"""

Scenario: Create a User with Post call

Given path '/public/v2/users'
And request requestPayload
And header Authorization = 'Bearer ' + tokenID
When method post
Then status 201
And match $.id == '#present'
And match $.name == 'dick'