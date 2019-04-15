@Bytes
Feature: Show the usage of Karate responseBytes keyword

  Scenario: Retrieve cat's picture
    Given url 'http://localhost:4567/v1/cats'
    And path 'Felix/portrait'
    When method GET
    Then status 200
    Then match responseBytes == read('Felix.jpeg')

