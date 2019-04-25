Feature: Karate hello cat

  Scenario: Retrieve a cat
    Given url 'http://karate-apidaysmad19.mocklab.io/cats/Billie'
    When method GET
    Then status 200
    And match response == { id: '#notnull', name: 'Billie', age: 2, parentId: 0}