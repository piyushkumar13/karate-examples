# Created by pikumar at 02/03/24
Feature: Data-driven testing
  # Enter feature description here

  Scenario: Problem with conventional way
    * def firstName = "Piyush"
    * def lastName = "Kumar"
    * print "Details are ", firstName, lastName
    # Now for another set of data, I will right something like
    * def firstName = "ABC"
    * def lastName = "XYZ"
    * print "Another details are ", firstName, lastName
    # If you have noticed, for each set of data we need to keep defining it again and again where core structure is same. In such cases, data-driven test helps

  Scenario Outline: Basics of Data Driven Test for <firstName>
    * def firstName = "<firstName>"
    * def lastName = "<lastName>"
    * def isManager = <isManager>
    * def id = <id>
    * print "Details are ", firstName, lastName, isManager, id
    Examples:
      | firstName | lastName | isManager | id  |
      | Piyush    | Kumar    | true      | 001 |
      | ABC       | XYZ      | false     | 002 |

  Scenario Outline: Basics of Data Driven Test with json payload for <firstName>
    * def jsonPayload =
    """
    {
    "fname": "<firstName>",
    "lname": "<lastName>",
    "isManager": <isManager>,
    "id": <id>
    }
    """
    * print "Json details are ", jsonPayload
    Examples:
      | firstName | lastName | isManager | id  |
      | Piyush    | Kumar    | true      | 001 |
      | ABC       | XYZ      | false     | 002 |

  Scenario Outline: Magic variables in data driven test for <firstName>
    * def jsonPayload =
    """
    {
    "fname": "<firstName>",
    "lname": "<lastName>",
    "isManager": <isManager>,
    "id": <id>
    }
    """
    * print "Json details are ", jsonPayload
    # When we print __row all the fields will be printed in string even if it is boolean or num etc. To fix it we need to use ! mark.
    * print "Row is ", __row
    * print "Row index is ", __num
    Examples:
      | firstName | lastName | isManager | id  |
      | Piyush    | Kumar    | true      | 001 |
      | ABC       | XYZ      | false     | 002 |

  Scenario Outline: Magic variables in data driven test to print in original data type for <firstName>
    * def jsonPayload =
    """
    {
    "fname": "<firstName>",
    "lname": "<lastName>",
    "isManager": <isManager>,
    "id": <id>
    }
    """
    * print "Json details are ", jsonPayload
    # When we print __row all the fields will be printed in string even if it is boolean or num etc. To fix it we need to use ! mark.
    * print "Row is ", __row
    * print "Row index is ", __num
    Examples:
      | firstName | lastName | isManager! | id! |
      | Piyush    | Kumar    | true       | 001 |
      | ABC       | XYZ      | false      | 002 |

  Scenario Outline: Auto variables in data driven test for <firstName>
    * def jsonPayload =
    """
    {
    "fname": "<firstName>",
    "lname": "<lastName>",
    "isManager": <isManager>,
    "id": <id>
    }
    """
    * print "Json details are ", jsonPayload
    # Column names of data driven table is available as auto variable which can be used to get their corresponding value.
    # As printed below
    * print "firstName is :: ", firstName
    * print "lastName is :: ", lastName
    * print "isManager is :: ", isManager
    * print "id is :: ", id
    Examples:
      | firstName | lastName | isManager! | id! |
      | Piyush    | Kumar    | true       | 001 |
      | ABC       | XYZ      | false      | 002 |

  Scenario Outline: Since auto variables are just variables so can be used with embedded exp for <firstName>
    * def jsonPayload =
    """
    {
    "fname": "#(firstName)",
    "lname": "#(lastName)",
    "isManager": #(isManager),
    "id": #(id)
    }
    """
    * print "Json details are ", jsonPayload
    # Column names of data driven table is available as auto variable which can be used to get their corresponding value.
    # As printed below
    * print "firstName is :: ", firstName
    * print "lastName is :: ", lastName
    * print "isManager is :: ", isManager
    * print "id is :: ", id
    Examples:
      | firstName | lastName | isManager! | id! |
      | Piyush    | Kumar    | true       | 001 |
      | ABC       | XYZ      | false      | 002 |

  Scenario Outline: As we know embedded expression can avoid null values, applying concept here for <firstName>
    * def jsonPayload =
    """
    {
    "fname": "#(firstName)",
    "lname": "##(lastName)",
    "isManager": ##(isManager),
    "id": #(id)
    }
    """
    * print "Json details are ", jsonPayload
    Examples:
      | firstName | lastName | isManager! | id! |
      | Piyush    | Kumar    |            | 001 |
      | ABC       |          | false      | 002 |

  Scenario Outline: Embedded expression in data driven table for <firstName>
    * def someName = "Piyush"
    * def jsonPayload =
    """
    {
#    "fname": "<firstName>",
    "lname": "##(lastName)",
    "isManager": ##(isManager),
    "id": #(id)
    }
    """
    * print "Json details are ", jsonPayload
    Examples:
      | firstName   | lastName | isManager! | id! |
      | #(someName) | Kumar    |            | 001 |
      | ABC         |          | false      | 002 |
