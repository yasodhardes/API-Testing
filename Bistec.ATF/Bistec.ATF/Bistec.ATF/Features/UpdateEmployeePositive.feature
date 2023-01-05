Feature: Positive - Update Employee

Background:
	Given the user admin is logged in
	And the user has an existing employee ID
	When Update Employee API is called

Scenario: Verify Error and Message repsonse
	Then the error should be false
	And the "update" "success" message should be displayed

@employee 
Scenario: Verify Status Code, Update Result and Message
	Then the user should be updated successfully
	Then "Employee updated successfully" message should be displayed without label error
	And PUT method status code should be 200
	
	

