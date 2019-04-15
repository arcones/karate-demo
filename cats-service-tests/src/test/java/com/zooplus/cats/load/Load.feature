Feature: Intended to be run from Gatling suite

  Scenario: Retrieve a cat
    Given url 'http://localhost:4567/v1/cats'
    And path 'Perry'
    And method GET
    Then status 200