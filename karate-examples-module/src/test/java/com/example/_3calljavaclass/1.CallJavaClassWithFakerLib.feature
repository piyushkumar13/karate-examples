Feature: Call java class

  Scenario: Create data faker object and use for json object - not recommended way
    * def faker = Java.type("net.datafaker.Faker")
    * def fakerObj = new faker()
    * def idValue = fakerObj.number().digits(2)
    * def nameValue = fakerObj.name().fullName()
    * set jsonObjectPayload
      | path | value     |
      | id   | idValue   |
      | name | nameValue |
    * print jsonObjectPayload

  Scenario: Create data faker object and use for json object - not recommended way
    * def fakerUtils = Java.type("com.example._3calljavaclass.utils.FakerUtils")
    * def idValue = fakerUtils.getId()
    * def nameValue = fakerUtils.getFullName()
    * set jsonObjectPayload
      | path | value     |
      | id   | idValue   |
      | name | nameValue |
    * print jsonObjectPayload