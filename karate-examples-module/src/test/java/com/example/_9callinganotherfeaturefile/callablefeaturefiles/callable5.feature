
Feature: Callable Feature File - 5
  # Enter feature description here

  Scenario: Callable Scenario - calling endpoint where request comes as argument
    Given url "https://reqres.in/api/users"
    # __arg is special variable which contains the argument
    And request __arg
    * print __arg
    When method post
    Then status 201
    And print "The response is ::: ", response
