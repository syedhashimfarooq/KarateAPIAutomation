Feature: GET API feature With Query

Scenario: get user details with Query

* def query = {status: 'active', gender: 'male', id: 7568248}
Given url baseUrl+'/public/v2/users'
And params query
When method GET
Then status 200
* print response

Scenario: get active user count with Query

* def query = {status: 'active'}
Given url baseUrl+'/public/v2/users'
And params query
When method GET
Then status 200
* def jsonResponse = response
* print jsonResponse
* def userCount = jsonResponse.length
* print userCount
