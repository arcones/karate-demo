

Feature: Hello world in Karate world

  Scenario: Create a cat
    Given url 'http://localhost:4567/v1/cats/Felix'
    When method GET
    Then status 200
    And match response == { id: '#notnull', name: 'Felix', age: 3, parentId: 1}

