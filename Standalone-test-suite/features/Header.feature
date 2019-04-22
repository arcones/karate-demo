@Headers
Feature: Show the usage of Karate header semantic field

  Background:
    * def testId = java.util.UUID.randomUUID()
    * def catName = 'Pozi'
    * configure headers = { 'Annoying-Header' : 'I should be always there' }

  Scenario: Create a cat correctly and the delete it
    Given url 'http://karate-apidaysmad19.mocklab.io/cats'
    And request ({ name: catName , age: 8 })
    And header Test-Execution-Info = 'AWS_DEV_' + testId
    When method PUT
    Then status 201
    And match response.name == '#(catName)'

    Given path response.name
    And def myHeaders = {Adios: 'muy buenas', Gato: 'Molesto'}
    And headers myHeaders
    When method DELETE
    Then status 204
    And match header Cat-Reply == 'hasta luego Mari Carmen'