# Created by pikumar at 03/03/24
Feature: Callonce usage
  # Callonce basically call the feature file once and caches its result.
  # Normally, callonce is used in cases of if we want to call an api to get the accessToken which can be used with all other
  # api calls. So, we can use callonce for a feature file which makes call to api to get the accessToken and this callonce
  # result will be cached. We need to use callonce in background block so that the callonce response will be available in
  # every scenario in a feature file.
  # If we want to callonce for all the feature files, then we can use karate.callSingle(..) in karate-config.js and set the
  # response in config.
  Background:
    * print "Setting up background"
    * def callableJson = callonce read("featurefiles/callable1.feature")
    # Another way of using callone
#    * def callableJson = karate.callSingle("featurefiles/callable1.feature")
    Given url "https://reqres.in/api/users/2"

  Scenario: Background scenario - 1
    When method get
    Then status 200
    And print response
    And print callableJson

  Scenario: Background scenario - 2
    When method get
    Then status 200
    And print response
    And print callableJson