Feature: Embedded Expression

  Scenario: Embedded expressions in karate framework
    * def employee = {fname: "Piyush", lname: "Kumar"}
    * print employee
    * def empFirstName = "Piyush"
    * def empLastName = "Kumar"
    # With Embedded expression
    * def employeeWithEmbExp = {fname: "#(empFirstName)", lname: '#(empLastName)'}
    * print employeeWithEmbExp
    # With other datatype apart from string
    * def idValue = 100
    * def isManager = false
    * def empWithEmbExpWithPrimitiveTypes = {fname: "#(empFirstName)", lname: '#(empLastName)', id: #(idValue), isManager: #(isManager)}
    * print empWithEmbExpWithPrimitiveTypes

  Scenario: Read values from karate-config and use them in embedded expression

    * def empWithEmbExpWithPrimitiveTypes = {fname: "#(empFirstName)", lname: '#(empLastName)', id: #(idValue), isManager: #(isManager)}
    * print empWithEmbExpWithPrimitiveTypes

  Scenario: Expressions in embedded expression

    * def empFirstName = "Piyush"
    * def empLastName = "Kumar"
    # Below tried to concatenate the firstname and lastname
    * def empWithExpAndEmbExp = {fullName: "#(empFirstName + ' ' + empLastName)", fname: "#(empFirstName)", lname: '#(empLastName)', id: #(idValue), isManager: #(isManager)}
    * print empWithExpAndEmbExp
    # Below have added hardcoded string "hello" with fullName
    * def empWithEmbExpWithHardcodedVal = {fullName: "#('Hello' + ' ' + empFirstName + ' ' + empLastName)", fname: "#(empFirstName)", lname: '#(empLastName)', id: #(idValue), isManager: #(isManager)}
    * print empWithEmbExpWithHardcodedVal

  Scenario: Embedded exp with json file
    * def empFirstName = "Piyush"
    * def empLastName = "Kumar"
    * def empPayload = read('payloads/employee.json')
    * print empPayload
    # We can use back-ticks for a variable
    * def welcomeText = `Hello $empFirstName`
    * print welcomeText

  Scenario: Assertions with embedded exp
    * def empFirstName = "Piyush"
    * def empLastName = "Kumar"
    * def fullName = "Piyush Kumar"
    * match fullName == empFirstName + " " + empLastName
    # Now, using embedded exp for assertion
    * match fullName == "#(empFirstName + ' ' + empLastName)"

  Scenario: Embed jsonpath
    * def employee = {fname: "Piyush", lname: "Kumar"}
    * def isManager = false
    * def idValue = "001"
    * def employee1 = {fname: "#(employee.fname)", lname: "#(employee.lname)", isManager: #(isManager), id: "#(idValue)" }
    * print employee1

  Scenario: Ignoring any null values in embedded exp(Need to use double hash for it)
    * def employee = {fname: "Piyush", lname: "Kumar"}
    * def isManager = false
    * def idValue = null
    * def employee1 = {fname: "#(employee.fname)", lname: "#(employee.lname)", isManager: #(isManager), id: "##(idValue)" }
    * print employee1

