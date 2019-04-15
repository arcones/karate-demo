@MatchersAndMarkers
Feature: Show other matches and markers

  Scenario: Create, retrieve and delete a cat
    Given url 'http://localhost:4567/v1/cats/master'
    When method GET
    Then status 200

    And match response == read('master.json')
    And match response != { id: '#notnull', name: 'Ezequiel', age: 1}
    And match response contains
    """
    {
      id: #uuid,
      age: #number,
      judo: #notpresent,
      isTheBest: #boolean,
      name: #string,
      favouriteFoods: #array,
      defeats: ##null,
      optional: ##number
    }
    """

    Given url 'http://localhost:4567/v1/cats/master'
    When method GET
    Then status 200

    And match response.favouriteFoods contains ['Tigerino','Purizon']
    And match response.favouriteFoods contains any ['Cosma','Royal Canin']
    And match response.favouriteFoods contains only ['Cosma','Tigerino','Purizon']

    And match $.pupils.[0] == '#object'
    And match $.pupils.[1].name == '#regex A.*l'
    And match response contains { age: '#? _ > 0 && _ < 100' }

