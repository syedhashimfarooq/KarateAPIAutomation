Feature: GET API feature

Scenario: get user details


Given url baseUrl+'/public/v2/users'
And path '7565790'
When method GET
Then status 200

* print response
* def jsonResponse = response
* print jsonResponse
* def actName = jsonResponse.name
* def userId = jsonResponse.id
* def userEmail = jsonResponse.email
* print actName
* match actName == 'Enakshi Khatri'
* match userId == 7565790
* match userEmail == 'khatri_enakshi@erdman.example'

Scenario: get user details - user not found

Given url 'https://gorest.co.in/public/v2/users'
And path '1'
When method GET
Then status 404