Feature: Reusable Feature File for Js functions
  Scenario: Callable Feature File for Js functions
    * def getName1 = function(){ return "Piyush" }
    * def getName2 = function(name) { return "Hello" + name }
    * def getName3 =
    """
    function(name) {
      let welcomeMsg = "Hello" + name
      return welcomeMsg
    }
    """
    * def getName4 =
    """
    function printName(name) {
      let welcomeMsg = "Hello" + name
      return welcomeMsg
    }
    """