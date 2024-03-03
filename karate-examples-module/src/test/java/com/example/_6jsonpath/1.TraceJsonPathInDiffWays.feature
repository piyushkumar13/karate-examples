# Internally Karate Framework uses jayway json path. Jayway json path doc : https://github.com/json-path/JsonPath

Feature: Different ways to trace json path values

  Scenario: Print json path value
    * def jsonObj =
      """
      {
    "store": {
        "book": [
            {
                "category": "reference",
                "author": "Nigel Rees",
                "title": "Sayings of the Century",
                "price": 8.95
            },
            {
                "category": "fiction",
                "author": "Evelyn Waugh",
                "title": "Sword of Honour",
                "price": 12.99
            },
            {
                "category": "fiction",
                "author": "Herman Melville",
                "title": "Moby Dick",
                "isbn": "0-553-21311-3",
                "price": 8.99
            },
            {
                "category": "fiction",
                "author": "J. R. R. Tolkien",
                "title": "The Lord of the Rings",
                "isbn": "0-395-19395-8",
                "price": 22.99
            }
        ],
        "bicycle": {
            "color": "red",
            "price": 19.95
        }
    },
    "expensive": 10
}
      """
    * match jsonObj.expensive == 10
    * def expensiveVal1 = get jsonObj.expensive
    * print "expensive value1 is ", expensiveVal1
    # If we use $.expensive with get it will not work since get will not know the context of which json object we intent to access
    # though it works with when we call api and get the response as $ there represents the response.
    # If we need to make $ work in this case, we need to do following :
    * def expensiveVal2 = get jsonObj $.expensive
    * print "expensive value2 is ", expensiveVal2
    # We can also write above in short form as follows
    * def expensiveVal3 = $jsonObj.expensive
    * print "expensive value3 is ", expensiveVal3
    # Using karate method for printing json path value
    # Using karate.get() method
    * def expensiveVal4 = karate.get('$jsonObj.expensive')
    * print "expensive value4 is ", expensiveVal4
    # Using karate.jsonPath() method
    * def expensiveVal5 = karate.jsonPath(jsonObj, '$.expensive')
    * print "expensive value5 is ", expensiveVal5
    * match karate.jsonPath(jsonObj, '$.expensive') == karate.get('$jsonObj.expensive')

  Scenario: Access and print array element in json
    * def jsonObj =
      """
      {
    "store": {
        "book": [
            {
                "category": "reference",
                "author": "Nigel Rees",
                "title": "Sayings of the Century",
                "price": 8.95
            },
            {
                "category": "fiction",
                "author": "Evelyn Waugh",
                "title": "Sword of Honour",
                "price": 12.99
            },
            {
                "category": "fiction",
                "author": "Herman Melville",
                "title": "Moby Dick",
                "isbn": "0-553-21311-3",
                "price": 8.99
            },
            {
                "category": "fiction",
                "author": "J. R. R. Tolkien",
                "title": "The Lord of the Rings",
                "isbn": "0-395-19395-8",
                "price": 22.99
            }
        ],
        "bicycle": {
            "color": "red",
            "price": 19.95
        }
    },
    "expensive": 10
}
      """
    * print "The index 1 book title is ", jsonObj.store.book[1].title
    # TODO : Following is the bug in the karate framework, we cannot print all the books using *.
    # * print "The index 1 book title is ", jsonObj.store.book[*].title
    # Due to the above bug, therefore, consider using karate methods to access
    # Using karate.get() method
    * print "All books titles using karate.get method", karate.get('$jsonObj.store.book[*].title')
    * print "Books title at specific index using karate.get method", karate.get('$jsonObj.store.book[*].title')[2]
    * print "Books title at specific index using karate.get method", karate.get('$jsonObj.store.book[2].title')
    # Using karate.jsonPath() method
    * print "All books titles using karate.jsonPath method", karate.jsonPath(jsonObj, '$.store.book[*].title')
    * print "Books title at specific index using karate.jsonPath method", karate.jsonPath(jsonObj, '$.store.book[*].title')[2]
    * print "Books title at specific index using karate.jsonPath method", karate.jsonPath(jsonObj, '$.store.book[2].title')

  Scenario: Access element in json using deep searches in json
    * def jsonObj =
      """
      {
    "store": {
        "book": [
            {
                "category": "reference",
                "author": "Nigel Rees",
                "title": "Sayings of the Century",
                "price": 8.95
            },
            {
                "category": "fiction",
                "author": "Evelyn Waugh",
                "title": "Sword of Honour",
                "price": 12.99
            },
            {
                "category": "fiction",
                "author": "Herman Melville",
                "title": "Moby Dick",
                "isbn": "0-553-21311-3",
                "price": 8.99
            },
            {
                "category": "fiction",
                "author": "J. R. R. Tolkien",
                "title": "The Lord of the Rings",
                "isbn": "0-395-19395-8",
                "price": 22.99
            }
        ],
        "bicycle": {
            "color": "red",
            "price": 19.95
        }
    },
    "expensive": 10,
    "title": "New Title"
}
      """
    # Following will find the title in json wherever it exists and return their values as array.
    * print "Accessing title via deep search", karate.jsonPath(jsonObj, '$..title')
    # Above also returned the title in the root. If I want to return title in the book array only.
    * print "Accessing title via deep search in a book array", karate.jsonPath(jsonObj, '$..book..title')

  Scenario: Access element in json array which matches specific condition in json
    * def jsonObj =
      """
      {
    "store": {
        "book": [
            {
                "category": "reference",
                "author": "Nigel Rees",
                "title": "Sayings of the Century",
                "price": 8.95
            },
            {
                "category": "fiction",
                "author": "Evelyn Waugh",
                "title": "Sword of Honour",
                "price": 12.99
            },
            {
                "category": "fiction",
                "author": "Herman Melville",
                "title": "Moby Dick",
                "isbn": "0-553-21311-3",
                "price": 8.99
            },
            {
                "category": "fiction",
                "author": "J. R. R. Tolkien",
                "title": "The Lord of the Rings",
                "isbn": "0-395-19395-8",
                "price": 22.99
            }
        ],
        "bicycle": {
            "color": "red",
            "price": 19.95
        }
    },
    "expensive": 10,
    "title": "New Title"
}
      """
    # If we want to return a title of a book which matches condition where author 'Evelyn Waugh'
    * print "Accessing title of a book matching condition", karate.jsonPath(jsonObj, "$.store.book[?(@.author == 'Evelyn Waugh')].title")
    # Access array element from the last, we need to use -ve index starting from -1
    * print "Accessing book from the last", karate.jsonPath(jsonObj, "$.store.book[-3]")
    # Access multiple array elements. Below, we access elements at 0th and 3rd index
    * print "Accessing multiple book element", karate.jsonPath(jsonObj, "$.store.book[0,3]")
    # Access array elements in a range. Below, we access elements from 0th index till 2nd index, 3rd will be excluded
    * print "Accessing book elements in a range", karate.jsonPath(jsonObj, "$.store.book[0:3]")
    # Use some methods on json array
    # Using length predefined method
    * print "Using length() method", karate.jsonPath(jsonObj, "$.store.book.length()")
#    # TODO : Using sum predefined method - bug in karate
#    * print "Using min() method - buggy way", karate.jsonPath(jsonObj, "$.store.book[*].price.sum()")
    # Using sum predefined method
    * print "Using sum() method", karate.jsonPath(jsonObj, "$..price.sum()")
    # Using min predefined method
    * print "Using min() method", karate.jsonPath(jsonObj, "$..price.min()")
    # Using max predefined method
    * print "Using min() method", karate.jsonPath(jsonObj, "$..price.max()")


