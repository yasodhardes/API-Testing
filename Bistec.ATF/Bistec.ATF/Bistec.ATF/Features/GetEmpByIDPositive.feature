Feature: Positive - Get Employee By Id

Background: 
	Given the user admin is logged in
	And the user has an existing employee ID
	When Get Employee By Id API is called
@employee
Scenario: Verify Status Code
	Then Status code should be 200

@employee
Scenario: Verify Schema is Valid
	Then the schema of the response should be valid

