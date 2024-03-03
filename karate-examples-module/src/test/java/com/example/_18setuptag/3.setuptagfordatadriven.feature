# TODO : There is a bug on this : https://stackoverflow.com/q/76965130
Feature: Setup tag usage for data-driven

  @setup
  Scenario:
    * def myjsonObj = read("payloads/request.json")
    * print myjsonObj

  Scenario Outline: Setup tag usage for data-driven scenario
    * print "The row is ::: ", __row

    Examples:
      | karate.setup().myjsonObj |

