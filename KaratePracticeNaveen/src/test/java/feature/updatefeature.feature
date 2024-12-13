Feature: Update User using PUT API
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



Scenario: Update a User with a Given Data
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

#put call to update the user

	* def requestPutPayload = 
"""
{
    "gender": "female",
    "status": "inactive"
}
"""

Given path '/public/v2/users/'+userID
And request requestPutPayload
And header Authorization = 'Bearer ' + tokenID
When method put
Then status 200
And match $.id == '#present'
And match $.name == 'dick'
And match $.email == requestPayload.email
