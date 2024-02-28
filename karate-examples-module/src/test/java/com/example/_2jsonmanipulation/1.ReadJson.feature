
Feature: ReadJson

  Scenario: Read json from external file
    Given url "https://reqres.in/api/users"
    * def reqPayload  = read('payloads/request.json')
    And request reqPayload
    When method post
    Then status 201

  Scenario: Read json from external file and set few fields
    Given url "https://reqres.in/api/users"
    * def reqPayload  = read('payloads/request.json')
    * set reqPayload.job = "Software Eng"
    * print reqPayload
    * set reqPayload.address[0] =
    """
    {
      "addressType": "Permanent",
      "city": "Bangalore",
      "state": "Karnataka"
    }
    """
    * print reqPayload
    # adding new fields
    * set reqPayload.company = "GW"
    * set reqPayload.lastName = "Kumar"
    * print "Request payload after all settings", reqPayload
    And request reqPayload
    When method post
    Then status 201

    # Removing few fields and then recalling the api
    * remove reqPayload.company
    And request reqPayload
    When method post
    Then status 201
    And print response