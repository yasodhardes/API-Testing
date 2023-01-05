Feature: Performance Testing


@messured
Scenario: Get Employees
	Given the user admin is logged in
	When Get Employee API is called
	Then the response time should be less than maximum repsonse time

@messured
Scenario: Get Employee By Id
	Given the user admin is logged in
	Given the user has an existing employee ID
	When Get Employee By Id API is called
	Then the response time should be less than maximum repsonse time

@messured
Scenario: Add Employee
	Given the user admin is logged in
    When Add Employee API is called
	Then the response time should be less than maximum repsonse time

@messured
Scenario: Update Employee
	Given the user admin is logged in
	Given the user has an existing employee ID
	When Update Employee API is called
	Then the response time should be less than maximum repsonse time

@messured
Scenario: Delete Employee
	Given the user admin is logged in
	And the user has an existing employee ID
	When Delete Employee API is called
	Then the response time should be less than maximum repsonse time

@messured
Scenario: Create Admin
	Given Admin username is $$randomstring
	And Admin password is pass123
	When Create admin api is called
	Then the response time should be less than maximum repsonse time

@messured
Scenario: Login Admin
	Given Admin username is sanjeewa
	And Admin password is test123
	When login admin api is called
	Then the response time should be less than maximum repsonse time

