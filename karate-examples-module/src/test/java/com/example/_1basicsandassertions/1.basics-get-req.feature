Feature: Checking Get request

  Scenario: Usage of Gherkin keywords and karate keywords for Get request
    Given url "https://reqres.in/api/users/2"
    When method get
    Then status 200

  Scenario: More karate keywords for Get request assertions
    Given url "https://reqres.in"
    And path "/api/users"
    # 2 is the id of a user
    And path "2"
    And header X-Request-Id = "Test123"
    When method get
    Then status 200
    And print response
    And print responseHeaders
    And print responseHeaders["Content-Type"][0]

  Scenario: More karate assertions for Get request assertions
    Given url "https://reqres.in"
    And path "/api/users"
    And path "2"
    And header X-Request-Id = "Test123"
    When method get
    Then status 200
    And print response
    And match responseStatus == 200
    And assert responseStatus == 200
    And print "responseStatus is " + responseStatus
    And match response == {"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}
    And match $ == {"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}
    And match response.data.id == 2
    And match response.data.email == "janet.weaver@reqres.in"
    And match header Content-Type == "application/json; charset=utf-8"
    And match header Content-Type contains "application/json"