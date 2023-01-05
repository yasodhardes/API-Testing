Feature: Security Testing


@security
Scenario: Get Employees
	When Get Employee API is called
	Then the Content should be null
	And the response should display error message
	And the API call should fail and success code should be false

@security 
Scenario: Get Employee By Id
	Given the user has an existing employee ID
	When Get Employee By Id API is called
	Then the Content should be null
	And the response should display error message
	And the API call should fail and success code should be false

@security
Scenario: Add Employee
    When Add Employee API is called
    Then the Content should be null
	And the response should display error message
	And the API call should fail and success code should be false

@security
Scenario: Update Employee
	Given the user has an existing employee ID
	When Update Employee API is called
	Then the Content should be null
	And the response should display error message
	And the API call should fail and success code should be false

@security 
Scenario: Delete Employee
	Given the user has an existing employee ID
	When Delete Employee API is called
	Then the Content should be null
	And the response should display error message
	And the API call should fail and success code should be false

@security
Scenario: Restrict Non-Admin login
	Given Admin username is $$randomstring
	And Admin password is pass123
	When login admin api is called
	Then Status code should be 401

@security
Scenario: Restrict Invalid Login
	Given Admin username is sanjeewa
	And Admin password is pass123
	When login admin api is called
	Then Status code should be 401
