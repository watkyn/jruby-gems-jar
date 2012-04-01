Feature: Do things with String that shouldn't be done
  As a developer
  I want to make the String class into a monolithic giant
  For my amusement

  Scenario: String should parse xml
    Given and xml fragment '<node>badstuff</node>'
    When node is called on an instance of String
    Then the value should be 'badstuff'
