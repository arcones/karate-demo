@CallAnotherFeature
Feature: Show how to call common feature

  Scenario: Use the token retrieved by another feature
    * def callForToken = call read('classpath:com/zooplus/auth/Common.feature')
    * def myToken = callForToken.response.accessToken
    And assert myToken == 'paco-paco-paco-que-mi-paco-paco-paco-paco'