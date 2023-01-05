Feature: Positive - Login Admin 


Scenario: Verify Status Code and Tokens
	Given Admin username is sanjeewa
	And Admin password is test123
	When login admin api is called
	Then Status code should be 201
	And response should have a valid access_token
	And response should have a valid id_token