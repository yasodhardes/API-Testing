Feature: Negative - Login Admin

@auth
Scenario: Verify Non-Admin login
	Given Admin username is $$randomstring
	And Admin password is pass123
	When login admin api is called
	Then the tokens should not be provided


@auth
Scenario: Verify Login with incorrect password
	Given Admin username is sanjeewa
	And Admin password is pass123
	When login admin api is called
	Then the tokens should not be provided
	And the message "The username or password don't match" should be displayed

@auth
Scenario: Verify Restrict Blank Input
	Given Admin username '<UserName>'
	And the password '<Password>'
	When login admin api is called
	Then Status code should be 400
	And the tokens should not be provided
	And the message "You must send the username and the password" should be displayed
	Examples: 
	| UserName  | Password |
	|           | Pass123  |
	| Shamphavi |          |