@KarateConfigVariablesUsage
Feature: Show the usage of set karate-config variables & classpath keyword

  Scenario: Retrieve cat's picture
    Given url baseURL
    And path 'v1', 'cats', 'Felix', 'portrait'
    When method GET
    Then status 200
    Then match responseBytes == read('classpath:fixtures/Felix.jpeg')