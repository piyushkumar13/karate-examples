Feature: Calling Another Feature File

  Scenario: Calling Feature File Scenario - 1
    # Callable class will return all the def defined in its feature file as a json.
    * def returnData = call read('callablefeaturefiles/callable1.feature')
    * print returnData
    * print returnData.firstName
    * print returnData.lastName

  Scenario: Calling Feature File Scenario - 2 - when callable file contains call to an api
    * def returnData = call read('callablefeaturefiles/callable2.feature')
    # returnData here will contain response body, responseHeaders, responseStatus, responseTime etc.
    * print "The return data after api call is ::: ", returnData
    * print "The response data after api call is ::: ", returnData.response
    * print "The response status after api call is ::: ", returnData.responseStatus

  Scenario: Calling Feature File Scenario - 3 - when callable file contains api call and some def variables
    * def returnData = call read('callablefeaturefiles/callable3.feature')
    # returnData here will contain response body, responseHeaders, responseStatus, responseTime etc.
    # and also all the def variables defined in callable file scenario
    * print "The return data after api call is ::: ", returnData
    * print "The response data after api call is ::: ", returnData.response
    * print "The response status after api call is ::: ", returnData.responseStatus
    * print "The firstName present as def variable in callable file scenario ", returnData.firstName
    * print "The lastName present as def variable in callable file scenario ", returnData.lastName

  Scenario: Calling Feature File Scenario - 4 - when callable file contains api call request with embedded exp
    * def firstName = "Piyush"
    * def job = "Soft Engineer"
    # Above variables will be available to the callable file as callable file is executed in this scenario context so
    # it can use these variables for embedded expression resolution
    * def returnData = call read('callablefeaturefiles/callable4.feature')
    * print "The return data after api call is ::: ", returnData

  Scenario: Calling Feature File Scenario - 5 - Passing arguments to the callable file
    * def firstName1 = "Piyush"
    * def job1 = "Soft Engineer"
    * def returnData = call read('callablefeaturefiles/callable4.feature') {firstName: "#(firstName1)", job: "#(job1)"}
    * print "The return data after api call is ::: ", returnData

  Scenario: Calling Feature File Scenario - 6 - Passing mapping object as arguments to the callable file
    * def firstName1 = "Piyush"
    * def job1 = "Soft Engineer"
    * def jsonObject =
    """
    {
    firstName: "#(firstName1)",
    job: "#(job1)"
    }
    """
    * def returnData = call read('callablefeaturefiles/callable5.feature') jsonObject
    * print "The return data after api call is ::: ", returnData

  Scenario: Calling Feature File Scenario - 7 - Passing request json as arguments to the callable file
    * def jsonReq =
    """
    {
    firstName: "Piyush",
    job: "Computer Science Engineer"
    }
    """
    * def returnData = call read('callablefeaturefiles/callable5.feature') jsonReq
    * print "The return data after api call is ::: ", returnData

  Scenario: Calling Feature File Scenario - 7 - Callable feature file containing multiple scenarios
    * def jsonReq1 =
    """
    {
    firstName: "Piyush",
    job: "Computer Science Engineer"
    }
    """
    * def returnData1 = call read('callablefeaturefiles/callable6.feature@scenario1') jsonReq1
    * print "The response of callable scenario1 ::: ", returnData1.response
    * def jsonReq2 =
    """
    {
    firstName: "ABC",
    job: "Computer Science Engineer"
    }
    """
    * def returnData2 = call read('callablefeaturefiles/callable6.feature@scenario2') jsonReq2
    * print "The response of callable scenario2 ::: ", returnData2.response

