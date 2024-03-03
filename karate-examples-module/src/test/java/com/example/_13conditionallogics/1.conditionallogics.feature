Feature: Conditional Logic in karate
  # Karate does not support conventional if and else statements.
  # It supports ternary operator or supports only if statement, no else statement.
  # These conditional statements can be used to call the feature file based on some status, thats one of the example
  Scenario: Usage of Ternary operator - 1
    * def status = 200
    * def result = status == 200 ? "success" : "failure"
    * print "the result is ::: ", result

  Scenario: Usage of Ternary operator - 2 - logical operators
    * def status = 200
    * def flag = true
    # we can use logical and or
    * def result = status == 200 && flag ? "success" : "failure"
    * print "the result is ::: ", result

  Scenario: Usage of Ternary operator - 3 - Nested ternary operator
    * def status = 200
    * def flag = true
    # we can use logical and or
    * def result = status == 200 ? flag == true ? "successFlag" : "failureFlag" : "Failure"
    * print "the result is ::: ", result


  Scenario: Usage of if statement
    * def status = 201
    * def resultValue1 = if(status == 200) "success"
    * print "The value 1 is ::: ", resultValue1
    * def resultValue2 = if(resultValue1 == null) "failed"
    * print "The value 2 is ::: ", resultValue2

  Scenario: Calling feature file conditionally
    * def status = 200
    # Below statement also applies for if statement i.e we need to use karate.call(..) in if statement.
    * def result = status == 200  ? karate.call("featurefiles/callable1.feature") : "failure"
    * print "the result is ::: ", result

