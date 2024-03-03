
# Default retry configuration is 3 counts and 3 seconds : https://github.com/karatelabs/karate?tab=readme-ov-file#retry-until
Feature: Retry mechanism

  Scenario: Call wrong url - retry until with default config
    Given url "https://reqres.in/api1/users/2"
    And retry until responseStatus == 200
    When method get
    Then status 200

  Scenario: Call wrong url - retry until with scenario level config
    * configure retry = {count: 2, interval: 2000}

    Given url "https://reqres.in/api1/users/2"
    And retry until responseStatus == 200
    When method get
    Then status 200

  Scenario: Call wrong url - retry using java method
    * configure retry = {count: 2, interval: 2000}

    Given url "https://reqres.in/api1/users/2"
    * def utils = Java.type("com.example._10retrymechanism.utils.Utils");
    And retry until utils.wannaRetry(karate.toString(response))
    When method get
    Then status 200

