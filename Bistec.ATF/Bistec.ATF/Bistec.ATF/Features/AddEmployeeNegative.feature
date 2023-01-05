Feature: Negative - Add Employee 


@employee
Scenario: Verify Restrict Unauthorized User
	When Add Employee API is called
	Then the response should display "UnauthorizedError" , "401" status code and "TokenExpiredError"

@employee
Scenario: Verify Restrict adding existing Employee ID
	Given the user admin is logged in
	And the user has an existing employee ID
	When the user add an employee with Existing ID
	Then the "already" "exists" message should be displayed


@employee
Scenario: Validate label of the message
	Given the user admin is logged in
	And the user has an existing employee ID
	When the user add an employee with Existing ID
	Then "Employee already exists" message should be displayed without label error






