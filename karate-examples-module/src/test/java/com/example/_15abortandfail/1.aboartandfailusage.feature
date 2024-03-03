Feature: Abort and Fail usage

  Scenario: Abort usage
    * def role = "user"
    * if(role != "admin") karate.abort()
    * print "Permission granted for ::: ", role

  Scenario: Fail usage
    * def role = "user"
    * if(role != "admin") karate.fail()
    * print "Permission granted for ::: ", role