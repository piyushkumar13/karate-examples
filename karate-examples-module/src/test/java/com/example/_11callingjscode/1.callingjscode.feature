Feature: Calling JS Code

  Scenario: Basics of calling JS code
    * def getName1 = function(){ return "Piyush" }
    * def name1 = getName1()
    * print "The name1 is ::: ", name1
    * def getName2 = function(name) { return "Hello" + name }
    * def name2 = getName2("Piyush")
    * print "The name2 is ::: ", name2
    * def getName3 =
    """
    function(name) {
      let welcomeMsg = "Hello" + name
      return welcomeMsg
    }
    """
    * def name3 = getName3("Piyush")
    * print "The name3 is :::: ", name3
    * def getName4 =
    """
    function printName(name) {
      let welcomeMsg = "Hello" + name
      return welcomeMsg
    }
    """
    * def name4 = getName4("Piyush")
    * print "The name4 is :::: ", name4


  Scenario: Calling external js files
    * def printName1 = read("jsfiles/jsutilfile1.js")
    * def name1 = printName1()
    * print "The name1 is :::", name1

    * def printName2 = read("jsfiles/jsutilfile2.js")
    * def name2 = printName2()
    * print "The name2 is :::", name2

    * def printName3 = read("jsfiles/jsutilfile3.js")
    * def name3 = printName3("Piyush")
    * print "The name3 is :::", name3

    # Note : JS files can only contain 1 js function, karate does not support jsfile with multiple functions, however, there is a
    # work around by using js capability of function is also an object.
    * def jsUtils = read("jsfiles/jsutilfile4.js")
    * def jsUtilName1 = jsUtils().printName1();
    * print jsUtilName1
    * def jsUtilName2 = jsUtils().printName2("Piyush");
    * print jsUtilName2
    * def jsUtilName3 = jsUtils().printName3("Piyush");
    * print jsUtilName3

  Scenario: Calling js functions in another feature file
    * def jsFns = call read("featurefile/reusablefeaturefile.feature")
    # We know that when we call another feature file, all the def variables are returned as json.
    * print jsFns
    * print "getName1 ::: ", jsFns.getName1()
    * print "getName2 ::: ", jsFns.getName2("Piyush")
    * print "getName3 ::: ", jsFns.getName3("Piyush")
    * print "getName4 ::: ", jsFns.getName4("Piyush")