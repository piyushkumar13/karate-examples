Feature: Test karate core library without juint

  Scenario: Make POST user call
    Given url "https://reqres.in/api/users"
    And request {"name":"morpheus","job":"leader"}
    When method post
    Then status 201