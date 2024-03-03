# Created by pikumar at 03/03/24
Feature: Env tag usage

  Scenario: Default scenario
    * print "Default env"

  @env=dev
  Scenario: Dev env scenario
    * print "Dev env"

  @env=qa
  Scenario: QA env scenario
    * print "QA env"

  # It will execute when env is either dev or qa.
  @env=dev,qa
  Scenario: Dev QA env scenario
    * print "Dev QA env"

  @envnot=qa
  Scenario: Not QA env scenario
    * print "Not QA env"

  # It will execute when env is qa.
  # Or runner is having tags as @something and env is qa
  @env=qa @something
  Scenario: QA env with something tag scenario
    * print "QA env with something tag"

