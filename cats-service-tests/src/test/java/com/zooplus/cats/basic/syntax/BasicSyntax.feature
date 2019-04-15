@BasicSyntax
Feature: Try out basic Karate syntax

  Background: Area to define variables used in the scenarios of this file
    * def catName = 'Neo'

  Scenario: Print my cat that is old and grumpy
    Given def age = 10
    And def myCat = { name: '#(catName)', age: '#(age)', isHappy: false}
    And match myCat.name == 'Neo'
    But assert !myCat.isHappy

  Scenario: Use function to baptise my cats
    Given def catPriest = function(arg) {return arg + ' De todos los Santos' }
    When def newbornCats =
    """
    [
      { name: '#(catPriest("Felix"))', age: 0},
      { name: '#(catPriest("Lucifer"))', age: 0},
      { name: '#(catPriest(catName))', age: 0},
    ]
    """
    Then match newbornCats.[0].name == 'Felix De todos los Santos'
    Then match newbornCats.[1].name == 'Lucifer De todos los Santos'
    But match newbornCats.[2].name != 'Neo'

  Scenario Outline: Greet several cats
    Given def cat = { name: '<visigothicName>', age: '<age>'}
    Then print 'Hello Visigothic cat ' + cat.name + ' who is ' + cat.age + ' years old'
    Examples:
      | visigothicName | age |
      | Ataulfo        | 12  |
      | Teodorico      | 2   |
      | Chindasvinto   | 9   |
      | Leovigildo     | 6   |

  Scenario: Greet the cat
    Given def greet = 'Guten morgen '
    Then print greet + catName

  Scenario: Print my cat that is old and happy
    Given def age = 10
    And def myCat = ({ name: catName, age: age, isHappy: true})
    Then match myCat.name == 'Neo'
    And print myCat

  Scenario: Assert that my favourite cat is happy
    Given def myCat = { name: '#(catName)', isHappy: true}
    Then assert myCat.isHappy
    And assert myCat.name == 'Neo'

  Scenario: Print a greeting for my favourite cat
    Given def catName = 'Neo'
    Then print 'Hello ' + catName

  Scenario: Use a table to fill my list of favourite cats
    Given table catList
      | position | name     |
      | 1        | 'Neo'    |
      | 2        | 'Panchi' |
      | 3        | 'Nami'   |
    Then match catList == [{position:1, name: 'Neo'},{position:2, name: 'Panchi'},{position:3, name: 'Nami'}]

  Scenario: Use math to calculate age of my cat
    Given def months = 72
    And def myCat = {name: 'Nami', age: '#(months / 12)'}
    Then assert myCat.age == 6

  Scenario: Calculate the age of my cat without decimals
    Given def months = 73
    And def myCat = {name: 'Nami', age: '#(~~(months / 12))'}
    Then assert myCat.age == 6

  Scenario: Print random data about my cat
    Given def scratchesInMyHouse = 382733478237496236378
    And def myCat = { name: 'Jander', scratches: '#(scratchesInMyHouse)', averageCravingsPerDay: 213.2348237}
    Then print myCat

  Scenario: Print random data about my cat prettified
    Given def scratchesInMyHouse = new java.math.BigDecimal(382733478237496236378)
    And def myCat = { name: 'Jander', scratches: '#(scratchesInMyHouse)', averageCravingsPerDay: '#(~~213.2348237)'}
    Then match myCat.averageCravingsPerDay == 213
    And print myCat.scratches

  Scenario: Store my cat and the last time of she asked me for food
    Given def lastRequestTime = java.lang.System.currentTimeMillis()
    And def myCat = { name: 'Itzel', lastRequestTime: '#(lastRequestTime)'}
    Then print myCat.lastRequestTime

  Scenario Outline: Extract a cat from file
    Given def cat = read('<catFile>')
    Then match cat contains { name: '#notnull' }
    And match cat !contains { behaviour: 'Good' }
    Examples:
      | catFile      |
      | ../clander.json |
      | fistro.json  |
      | jander.json  |

