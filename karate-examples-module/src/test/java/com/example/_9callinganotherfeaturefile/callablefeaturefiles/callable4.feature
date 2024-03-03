
Feature: Callable Feature File - 4
  # Enter feature description here

  Scenario: Callable Scenario - calling endpoint with request containing embedded expression
    Given url "https://reqres.in/api/users"
    And request
    """
    {
    "name": "#(firstName)",
    "job": "#(job)"
    }
    """
    When method post
    Then status 201
    And print "The response is ::: ", response
