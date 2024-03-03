# Created by pikumar at 02/03/24
Feature: # Enter feature name here
  # Enter feature description here

  Scenario Outline: Reading json file for using in json for <firstName>
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
      | read('payloads/employee.json') |

  Scenario Outline: Reading json file for using in json with embedded exp for <firstName>
    * def jsonPayload =
    """
    {
    "fname": "#(firstName)",
    "lname": "#(lastName)",
    "isManager": #(isManager),
    "id": #(id)
    }
    """
    # Note All rules meant for embedded with null values we had seen can also be applied here by using double #
    * print "Json details are ", jsonPayload
    Examples:
      | read('payloads/employee.json') |