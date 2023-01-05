Feature: Feature1
As a User 
I can Create Admin
So that I can manage Emplkoyees

@Auth
Scenario: Create Admin
	Given The User is abc1234
	And The Password is pass1234
	When Call the Created Admin API
	Then The Responses status code should be 201
