@Path
Feature: Show the usage of Karate core keywords

  Background: Store common variables used accross the scenarios
    * url 'http://localhost:4567/v1/cats'

  Scenario: Retrieve favourite food of cat's parent
    Given path 'Felix/parent/food'
    When method GET
    Then status 200
    And match response.brand == 'Cosma'

  Scenario: Retrieve favourite food of cat's parent
    Given path '/Felix/parent/food'
    When method GET
    Then status 200
    And match response.brand == 'Cosma'

  Scenario: Retrieve favourite food of cat's parent
    Given path 'Felix', 'parent', 'food'
    When method GET
    Then status 200
    And match response.brand == 'Cosma'

  Scenario: Create a cat
    Given request { name: 'Iggy', age: 2 }
    When method PUT
    Then status 201
    And match response == { id: '#notnull', name: 'Iggy', age: 2, parentId: 0}

    Given path response.name
    When method DELETE
    Then status 204

  Scenario: Create, retrieve and delete a cat
    Given request { name: 'Satan', age: 2 }
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

  Scenario: Create, retrieve and delete a cat
    * def catName = 'Satan'

    Given request { name: '#(catName)', age: 2 }
    When method PUT
    Then status 201
    And match response == { id: '#notnull', name: '#(catName)', age: 2, parentId: 0}

    Given path response.name
    When method GET
    Then status 200
    And match response == { id: '#notnull', name: '#(catName)', age: 2, parentId: 0}
    And print catName

    Given path response.name
    When method DELETE
    Then status 204

    Given path catName
    When method GET
    Then status 404


