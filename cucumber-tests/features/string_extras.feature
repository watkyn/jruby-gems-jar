Feature: Do things with String that shouldn't be done
  As a developer
  I want to make the String class do unexpected things 
  For my amusement

  Scenario Outline: String should override send so as to confuse people 
    When <method_name> is called on an instance of String
    Then the value returned should be '<reversed_method_name>'
  
  Examples:
    |method_name|  reversed_method_name|
    |each| hcae|
    |million|  noillim|
    |otto|  otto|

  Scenario: String should tweet a quip when watkyn is called
    When watkyn is called on an instance of String
    Then 'quip' is tweeted
