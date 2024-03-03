Feature: Setup usage
  # Enter feature description here

  Scenario: Multiple Setup usage - 1
    * def jsonObj1 = karate.setup("data2")
    * print "jsonObject1 is ::: ", jsonObj1.jsonPayload2

  Scenario: Multiple Setup usage - 2
    * def jsonObj2 = karate.setup("data1")
    * print "jsonObject2 is ::: ", jsonObj2.jsonPayload1

  @setup=data1
  Scenario: Data setup - 1
    * def jsonPayload1 =
    """
    {
      "name": "Piyush",
      "job": "Engineer"
    }
    """


  @setup=data2
  Scenario: Data setup - 2
    * def jsonPayload2 =
    """
    {
      "name": "Piyush",
      "job": "Engineer",
      "address": [
        {
          "addressType": "Permanent",
          "city": "BLR",
          "state": "Karnataka"
        },
        {
          "addressType": "Temporary",
          "city": "New Delhi",
          "state": "Delhi"
        }
      ]
    }
    """
