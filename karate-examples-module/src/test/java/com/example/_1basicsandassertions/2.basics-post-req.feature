Feature: Checking POST request

  Scenario: Usage of Gherkin keywords and karate keywords for POST request
    Given url "https://reqres.in/api/users"
    And request {"name":"Piyush","job":"Engineer"}
    When method post
    Then status 201

  Scenario: More karate keywords for POST request assertions
    Given url "https://reqres.in"
    And path "/api/users"
    And header X-Request-Id = "Test123"
    When method post
    Then status 201
    And print response
    And print responseHeaders
    And print responseHeaders["Content-Type"][0]

  Scenario: POST request with multiple line payload
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

  Scenario: Create payload for POST req
    Given url "https://reqres.in/api/users"
    * def requestPayload = {}
    * requestPayload.name = "Piyush"
    * requestPayload.job = "Engineer"
    * requestPayload.address = []
    * requestPayload.address[0] = {}
    * requestPayload.address[0].addressType = "Permanent"
    * requestPayload.address[0].city = "BLR"
    * requestPayload.address[0].state = "Karnataka"
    * requestPayload.address[1] = {}
    * requestPayload.address[1].addressType = "Temporary"
    * requestPayload.address[1].city = "New Delhi"
    * requestPayload.address[1].state = "Delhi"
    * print requestPayload
    And request requestPayload
    When method post
    Then status 201