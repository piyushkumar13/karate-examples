# We can use tags at Feature file level.
Feature: Tags usage

  @Smoke # we can give any name for tag
  Scenario: Smoke Test - 1
    * print "Smoke Test - 1"

  @Smoke
  Scenario: Smoke Test - 2
    * print "Smoke Test - 2"

  @Sanity
  Scenario: Sanity Test - 1
    * print "Sanity Test - 1"

  @Smoke
  @Sanity
  Scenario: Sanity and Smoke Test - 1
    * print "Sanity and Smoke Test - 1"