@HTTPMethodsAndStatus
Feature: Show the usage of Karate methods & status core keywords

  Scenario: Create, retrieve, update and delete a cat
    * def catName = 'Anacleto'

    Given url 'http://karate-apidaysmad19.mocklab.io/cats'
    And request { name: '#(catName)', age: 4 }
    When method PUT
    Then status 201
    And match response == { id: '#notnull', name: '#(catName)', age: 4, parentId: 0}

    Given request { id: '#notnull', name: '#(catName)', age: 2, parentId: 1}
    When method POST
    Then status 200
    And match response.age == 2
    And match response.parentId == 1

    Given path response.name
    When method DELETE
    Then assert responseStatus == 204 || responseStatus == 200

  Scenario: Retrieve an cat or only its header
    * def environment = 'dev'
    * def getOrHead = (environment == 'dev' ? 'GET':'HEAD')

    Given url 'http://karate-apidaysmad19.mocklab.io/cats'
    And path 'Felix'
    When method getOrHead
    Then assert responseStatus == 404 || responseStatus == 200