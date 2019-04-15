@HelloCat
Feature: Try out every Karate feature that will be shown in the talk using the cats API as target

  Scenario: Create a cat
    Given url 'http://localhost:4567/v1/cats'
    And request { name: 'Chiquito', age: 8 }
    When method PUT
    Then status 201
    And match response == { id: '#notnull', name: 'Chiquito', age: 8, parentId: 0}
    And match response $.name == 'Chiquito'

    Given path response.name
    When method DELETE
    Then status 204

  Scenario: Create, retrieve and delete a cat
    Given url 'http://localhost:4567/v1/cats'
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

    Given path 'Satan'
    When method GET
    Then status 404

  Scenario: Retrieve a non-existent cat
    Given url 'http://localhost:4567/v1/cats'
    And path 'Alfredo'
    And method GET
    Then status 404