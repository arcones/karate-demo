@Cookies
Feature: Show the usage of Karate cookie semantic field

  Background: Remove cookies between scenarios
    * configure cookies = null

  Scenario: Check that my cat will not accept specific cookie
    Given url 'http://localhost:4567/v1/cats'
    And path 'Felix'
    And cookie Food = 'RoyalCanin'
    When method GET
    Then status 406
    And assert responseCookies['Food'].value == 'RoyalFeline'

  Scenario: Retrieve cat
    Given url 'http://localhost:4567/v1/cats'
    And path 'Felix'
    And cookies { Food : 'RoyalFeline', Please: 'ForgiveMe'}
    When method GET
    Then status 200
    And assert responseCookies['Forgiven'].value == 'DoNotDoItAgain'
    And assert responseTime < 1000


