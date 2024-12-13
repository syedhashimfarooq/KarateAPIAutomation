Feature: Delete User using given data
Background: 
* url 'https://gorest.co.in'

* def random_string = 
	"""
		function(s){
			var text = "";
			var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			for(var i=0; i<s; i++)
				text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
				return text;
		}
	"""
	
	* def randomString = random_string(10)
	* print randomString
	* def requestPayload = 
"""
{
    "name": "dick",
    "gender": "male",
    "status": "active"
}

"""
	* set requestPayload.email = randomString + "@gmail.com" 
  * print requestPayload


Scenario: Delete a User from available userID
#create a user first before updating it

Given path '/public/v2/users'
And request requestPayload
And header Authorization = 'Bearer ' + tokenID
When method post
Then status 201
And match $.id == '#present'


#fetch the userid from the POST call response

* def userID = $.id
* print userID

#delete call to Delete the user

	* def requestDeletePayload = 
"""
{
    "id": userID
}
"""

Given path '/public/v2/users/'+userID
And request requestDeletePayload
And header Authorization = 'Bearer ' + tokenID
When method delete
Then status 204

#try getting the same user 

Given url baseUrl+'/public/v2/users/' + userID
When method GET
Then status 404
And match $.message == 'Resource not found'  

