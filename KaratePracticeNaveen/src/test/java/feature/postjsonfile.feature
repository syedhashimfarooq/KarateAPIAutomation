Feature: Create User using POST API WITH JSON FILE

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
	* def requestPayload = read('classpath:src/test/resources/payload/user.json')
	* set requestPayload.email = randomString + "@gmail.com" 
  * print requestPayload



Scenario: Create a User with Post call with JSON FILE

Given path '/public/v2/users'
And request requestPayload
And header Authorization = 'Bearer ' + tokenID
When method post
Then status 201
And match $.id == '#present'
And match $.name == 'dick'