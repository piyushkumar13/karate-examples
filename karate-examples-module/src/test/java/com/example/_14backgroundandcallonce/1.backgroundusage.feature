# Created by pikumar at 03/03/24
Feature: Background usage
  Background:
    * print "Setting up background"
    Given url "https://reqres.in/api/users/2"

  Scenario: Background scenario - 1
    When method get
    Then status 200
    And print response

  Scenario: Background scenario - 2
    When method get
    Then status 200
    And print response