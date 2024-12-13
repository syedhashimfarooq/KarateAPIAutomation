Feature: GET API feature via TokenID

Scenario: get user details via TokenID

* print tokenID
Given header Authorization = 'Bearer ' + tokenID
Given url baseUrl+'/public/v2/users'
And path '7568269'
When method GET
Then status 200