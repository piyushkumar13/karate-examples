# Fuzzy matchers list : https://github.com/karatelabs/karate?tab=readme-ov-file#fuzzy-matching


Feature: Fuzzy matcher examples

  Scenario: Fuzzy matchers - 1
    * def jsonPayload =
    """
    {
    "id": 123,
    "firstName": "Piyush",
    "lastName": "Kumar",
    "isManager": false,
    "dob": "1990"
     }
    """
    * match jsonPayload.id == "#number"
    * match jsonPayload.firstName == "#string"
    * match jsonPayload.isManager == "#boolean"
    * match jsonPayload.dob == "#regex [0-9]{4}"
    * match jsonPayload.dob == "#regex \\d{4}"
#    * match jsonPayload.id == "#regex [0-9]{3}" - this will fail as regex can be applied only on string, so we need to convert id to string first as follows :
    * match (jsonPayload.id + "") == "#regex [0-9]{3}"

  Scenario: Fuzzy matchers - 2
    * def jsonPayload =
    """
    {
    "id": 123,
    "firstName": "Piyush",
    "lastName": "Kumar",
    "isManager": false,
    "dob": "1990",
    "city": "Blr"
     }
    """
    * match jsonPayload ==
    """
    {
    "id": #present,
    "firstName": "#present",
    "lastName": "#ignore",
    "isManager": #present,
    "dob": "#ignore",
    "city": "#notnull"
     }
    """

  Scenario: Fuzzy matchers - 2
    * def jsonPayload =
    """
    {
    "id": 123,
    "firstName": "Piyush",
    "lastName": "Kumar",
    "isManager": false,
    "dob": "1990",
    "skills": ["java", "golang"]
     }
    """
    * match jsonPayload.skills == "#array"
    # We can also write above assertion as below
    * match jsonPayload.skills == "#[]"
    # We can also write array assertion with elements length
    * match jsonPayload.skills == "#[2]"
    # To check skills should be array and should contain only strings
    * match jsonPayload.skills == "#[] #string"
    # Fuzzy matcher with condition - check first element in array is java
    * match jsonPayload.skills == "#? _[0] == 'java'"
    # We can also check length of string element
    * match jsonPayload.skills == "#? _[0].length == 4"


