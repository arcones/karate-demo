@URL
Feature: Show the usage of Karate core keywords

  Scenario: Create, retrieve and delete a cat
    Given url 'http://localhost:4567/v1/cats'
    And request { name: 'Billie', age: 2 }
    When method PUT
    Then status 201
    And match response.parentId == 0

    Given path response.name
    When method GET
    Then status 200
    And match response == { id: '#notnull', name: 'Billie', age: 2, parentId: 0}

    Given path response.name
    When method DELETE
    Then status 204

    Given path 'Billie'
    When method GET
    Then status 404

  Scenario: Retrieve cat's parent
    Given url 'http://localhost:4567/v1/cats'
    And path 'Felix/parent'
    When method GET
    Then status 200
    And match response == { id: '#notnull', name: 'Perry', age: 9, parentId: 0}