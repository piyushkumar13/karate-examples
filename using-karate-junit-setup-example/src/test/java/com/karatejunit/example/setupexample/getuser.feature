Feature: Test karate core library without juint

  Scenario: Make GET user call
    Given url "https://reqres.in/api/users/2"
    When method get
    Then status 200
    And print response