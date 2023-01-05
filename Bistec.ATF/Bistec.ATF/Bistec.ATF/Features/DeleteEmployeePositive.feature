Feature: Positive - Delete Employee

Background: 
	Given the user admin is logged in
	And the user has an existing employee ID
	When Delete Employee API is called

@employee 
Scenario: Verify Error and Message repsonse
	Then the error should be false
	And the "delete" "success" message should be displayed

@employee 
Scenario: Verify Delete Success
	When Get Employee By Id API is called
	Then Status code should be 404 

@employee 
Scenario: Verify Status Code and Message
	Then "Employee deleted successfully" message should be displayed without label error
	And PUT method status code should be 200
