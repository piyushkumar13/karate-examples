
Feature: Callable Feature File - 6 - with multiple scenarios
  # Enter feature description here

  @scenario1
  Scenario: Callable Scenario - 1
    Given url "https://reqres.in/api/users"
    And request __arg
    When method post
    Then status 201
    And print "The response for scenario 1 is ::: ", response

  @scenario2
  Scenario: Callable Scenario - 2
    Given url "https://reqres.in/api/users"
    And request __arg
    When method post
    Then status 201
    And print "The response for scenario 2 is ::: ", response
