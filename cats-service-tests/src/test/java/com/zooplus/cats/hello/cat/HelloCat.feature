@HelloCat
Feature: Basic warm up with Karate

  Scenario: Create, retrieve and delete a cat
    Given url 'http://karate-apidaysmad19.mocklab.io/cats'
    And request { name: 'Satan', age: 2 }
    When method PUT
    Then status 201
    And match response == { id: '#notnull', name: 'Satan', age: 2, parentId: 0}

    Given path response.name
    When method GET
    Then status 200
    And match response == { id: '#notnull', name: 'Satan', age: 2, parentId: 0}

    Given path response.name
    When method DELETE
    Then status 204

  Scenario: Retrieve a non-existent cat
    Given url 'http://karate-apidaysmad19.mocklab.io/cats'
    And path 'Alfredo'
    And method GET
    Then status 404