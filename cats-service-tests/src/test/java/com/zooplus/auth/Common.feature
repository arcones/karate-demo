@Common
Feature: Intended to be called from another features

  Scenario: Retrieve the token
    Given url baseURL
    And path 'auth'
    And form field username =  'arcones@karate-meetup.com',
    And form field password = 'CambiameDeUnaVez123'
    And method GET
    And status 200

    