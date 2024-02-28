Feature: Create & Read Json using table approach
  # Enter feature description here

  Scenario: Create simple json using table
    * set jsonObjectPayload
      | path | value      |
      | name | "Piyush"   |
      | job  | "Engineer" |
    * print jsonObjectPayload

  Scenario: Create nested json using table
    * set jsonObjectPayload
      | path          | value       |
      | name          | "Piyush"    |
      | job           | "Engineer"  |
      | address.city  | "Bangalore" |
      | address.state | "Karnataka" |
    * print jsonObjectPayload

  Scenario: Create nested json with array using table
    * set jsonObjectPayload
      | path                         | value                |
      | name                         | "Piyush"             |
      | job                          | "Engineer"           |
      | address.city                 | "Bangalore"          |
      | address.state                | "Karnataka"          |
      | degrees[0]                   | "Btech"              |
      | degrees[1]                   | "Mtech"              |
      | specialization[0].courseName | "Data Structures"    |
      | specialization[0].courseId   | 5                    |
      | specialization[1].courseName | "Competitive Coding" |
      | specialization[1].courseId   | 6                    |
    * print jsonObjectPayload

  Scenario: Create simple json using table with variables
    * def name = "Piyush"
    * def job = "Enigneer"
    * set jsonObjectPayload
      | path | value |
      | name | name  |
      | job  | job   |
    * print jsonObjectPayload

  Scenario: Create simple json array using table
    * set jsonArrayObjectPayload
      | path | 0                   | 1          |
      | name | "Piyush"            | "Abhi"     |
      | Job  | "Software Engineer" | "Engineer" |
    * print jsonArrayObjectPayload

  Scenario: Create simple json array using table - with empty field
    * set jsonArrayObjectPayload
      | path | 0                   | 1      |
      | name | "Piyush"            | "Abhi" |
      | Job  | "Software Engineer" |        |
    * print jsonArrayObjectPayload

  Scenario: Create simple json array using table - with null field
    * set jsonArrayObjectPayload
      | path | 0                   | 1      |
      | name | "Piyush"            | "Abhi" |
      | Job  | "Software Engineer" | (null) |
    * print jsonArrayObjectPayload

  Scenario: Manipulate existing json using table
    * def existingJsonObjPayload = {"name": "Piyush"}
    * set existingJsonObjPayload
      | path | value      |
      | Job  | "Engineer" |
    * print existingJsonObjPayload

  Scenario: Manipulate existing json by reading from external file using table
    * def existingJsonObjPayload = read('payloads/request.json')
      # Adding new field
    * set existingJsonObjPayload
      | path | value               |
      | dob  | "13/02/1990"        |
      | job  | "Software Engineer" |
    * print existingJsonObjPayload

  Scenario: Manipulate existing json by reading from external file using table
    * def existingJsonObjPayload = read('payloads/request.json')
    # Adding new field object
    * set existingJsonObjPayload.details
      | path | value        |
      | dob  | "13/02/1990" |
      | doj  | "11/12/2023" |
    * print existingJsonObjPayload