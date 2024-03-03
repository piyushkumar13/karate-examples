
Feature: Callable Feature File - 3
  # Enter feature description here

  Scenario: Callable Scenario - calling an endpoint and containing def variables
    * def firstName = "Piyush"
    * def lastName = "Kumar"
    Given url "https://reqres.in/api/users"
    And request
    """
    {
    "name": "Piyush",
    "job": "Engineer"
    }
    """
    When method post
    Then status 201
    And print "The response is ::: ", response
