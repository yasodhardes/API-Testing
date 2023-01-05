Feature: Positive - Get All Employees

As an admin
I should be able to view all employees
So that I can manage company

Background: 
	Given the user admin is logged in
	When Get Employee API is called

@employee
Scenario: Verify Status code and Count
	Then Status code should be 200
	And Response should display employee details









