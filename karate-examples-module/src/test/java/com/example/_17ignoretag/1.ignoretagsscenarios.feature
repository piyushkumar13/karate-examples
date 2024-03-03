# We can use ignore tag at feature file level.
Feature: Ignore tag usage

  Scenario: Should run - 1
    * print "Smoke Test - 1"
    # calling another scenario from this scenario. Other scenario will be called from this scenario even if another scenario is tagged with @Ignore
    # As this scenario is not ignored so it will be called and execute all the line of codes in it
    * call read("@util")

  @ignore @util
  Scenario: Should ignore - 1
    * print "Smoke Test - 2"

  Scenario: Should run - 2
    * print "Sanity Test - 1"

  Scenario: Should run - 3
    * print "Sanity and Smoke Test - 1"