Feature: Negative - Get Employee By ID

@employee
Scenario: Verify Restrict Unauthorized user
	Given the user has an existing employee ID
	When Get Employee By Id API is called
	Then the response should display "UnauthorizedError" , "401" status code and "TokenExpiredError"

@employee
Scenario: Verify display error message for Non Employee ID
	Given the user admin is logged in
	And  the user has a non exiting Employee ID
	When Get Employee By Id API is called
	Then "user not found" message should be displayed without label error







