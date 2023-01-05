Feature: Negative - Update Employee

@employee
Scenario: Verify Restrict Unauthorized User
	Given the user has an existing employee ID
	When Update Employee API is called
	Then the response should display "UnauthorizedError" , "401" status code and "TokenExpiredError"

@employee
Scenario: Verify display error message for Non Employee ID
	Given the user admin is logged in
	And  the user has a non exiting Employee ID
	When Update Employee API is called
	Then the "not" "found" message should be displayed
@employee
Scenario: Validate label of message
	Given the user admin is logged in
	And  the user has a non exiting Employee ID
	When Update Employee API is called
	Then "Employee not found" message should be displayed without label error





