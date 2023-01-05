Feature: Positive - Add Employee

Background:
    Given the user admin is logged in
    When Add Employee API is called
@employee 
Scenario: Verify Status Code, Message and Error response
    Then Status code should be 201
    Then the error should be false
    And the "add" "success" message should be displayed
@employee 
Scenario: Validate label of message
    Then "Employee added successfully" message should be displayed without label error

