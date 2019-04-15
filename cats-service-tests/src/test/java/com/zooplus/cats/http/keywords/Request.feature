@Requests
Feature: Show the usage of Karate request core keyword

  Scenario: Create and update a cat
    Given url 'http://localhost:4567/v1/cats'
    And request { name: 'Samu', age: 2 }
    When method PUT
    Then status 201
    And match response == { id: '#notnull', name: 'Samu', age: 2, parentId: 0}

    Given request read('samuUpdate.json')
    When method POST
    Then status 200
    And match response.age == 3

    Given path response.name
    When method DELETE
    Then status 204

    Given path 'Samu'
    When method GET
    Then status 404

  Scenario: Retrieve cat by name
    * def cat = { name: 'Samu', age: 2 }

    Given url 'http://localhost:4567/v1/cats'
    And request cat
    When method PUT
    Then status 201
    And match response == { id: '#notnull', name: 'Samu', age: 2, parentId: 0}