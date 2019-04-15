@HTTPMethodsAndStatus
Feature: Show the usage of Karate methods & status core keywords

  Scenario: Create, retrieve, update and delete a cat
    * def catName = 'Anacleto'

    Given url 'http://localhost:4567/v1/cats'
    And request { name: '#(catName)', age: 4 }
    When method PUT
    Then status 201
    And match response == { id: '#notnull', name: '#(catName)', age: 4, parentId: 0}

    Given request { id: '#notnull', name: '#(catName)', age: 1, parentId: 1}
    When method POST
    Then status 200
    And match response.age == 1
    And match response.parentId == 1

    Given path response.name
    When method GET
    Then status 200
    And match response == { id: '#notnull', name: '#(catName)', age: 1, parentId: 1}

    Given path response.name
    When method DELETE
    Then assert responseStatus == 204 || responseStatus == 200

    Given path catName
    When method GET
    Then status 404

  Scenario: Retrieve an cat or only its header
    * def environment = 'dev'
    * def getOrHead = (environment == 'dev' ? 'GET':'HEAD')

    Given url 'http://localhost:4567/v1/cats'
    And path 'Felix'
    When method getOrHead
    Then assert responseStatus == 404 || responseStatus == 200