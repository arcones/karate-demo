@Headers
Feature: Show the usage of Karate header semantic field


  Scenario: Create a cat correctly and the delete it
    Given url 'http://karate-apidaysmad19.mocklab.io/cats'
    And request { name: 'Paco' , age: 8 }
    And header Test-Execution-Info = '20190426'
    When method PUT
    Then status 201
    And match response.name == 'Paco'

    Given path response.name
    And def myHeaders = {Adios: 'muy buenas', Gato: 'Molesto'}
    And headers myHeaders
    When method DELETE
    Then status 204
    And match header Cat-Reply == 'hasta luego Mari Carmen'