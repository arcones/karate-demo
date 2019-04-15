@QueryParams
Feature: Show the usage of Karate param keyword

  Background:
    * url 'http://localhost:4567/v1/cats'

  Scenario: Retrieve filtered cats

    Given param age = 9
    When method GET
    Then status 200
    And match response == read('catsAged9.json')

    Given params { age: 9, name: 'Jacobo'}
    When method GET
    Then status 200
    And match response.[0].name == 'Jacobo'
    And match response.[0].age == 9


