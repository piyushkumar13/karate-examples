Feature: Using Karate Repeat

  Scenario: Karate Repeat Example for JS function
    * def helloFunc1 = function(){ return "Hello1"}
    * def repeatCall1 = karate.repeat(3, helloFunc1)
    * print "repeatCall1 return value", repeatCall1

    # Accepting argument explicitly is not possible in karate.repeat but we can use the index to get arguments from js argument object
    * def helloFunc2 = function(index){ return index + " Hello1"}
    * def repeatCall2 = karate.repeat(3, helloFunc2)
    * print "repeatCall2 return value", repeatCall2

  Scenario: Karate Repeat Example for Java method
    # Karate.repeat method only supports JS function to be called. So, what can be done is we can wrap the calling of java function in
    # JS function and use that in karate.repeat method.
    * def utils = Java.type("com.example._12usingrepeatmethod.utils.FakerUtils");
    * def jsWrap = function(){ return utils.getFullName() }
    * def repeatOutput = karate.repeat(3, jsWrap)
    * print "repeat output ::: ", repeatOutput

  Scenario: Karate Repeat Example for calling feature file
    # Karate.repeat method only supports JS function to be called. So, what can be done is we can wrap the calling of feature function in
    # JS function.
    # Also, we cannot use call read since we will be calling inside js function. For this, we need to use karate.call(..) method.
    * def jsWrap = function(){ return karate.call("featurefiles/callable1.feature") }
    * def repeatOutput = karate.repeat(3, jsWrap)
    * print "repeat output ::: ", repeatOutput