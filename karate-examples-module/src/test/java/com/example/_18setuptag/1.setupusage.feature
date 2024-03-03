Feature: Setup usage
  # Enter feature description here

  Scenario: Setup usage - 1
    * def jsonObj1 = karate.setup()
    * print "jsonObject is ::: ", jsonObj1.jsonPayload

  @setup
  Scenario: Data setup
    * def jsonPayload =
    """
    {
      "name": "Piyush",
      "job": "Engineer"
    }
    """
