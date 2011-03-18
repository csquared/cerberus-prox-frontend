Feature:
  In order to add new cards to the system
  As an admin
  I need to be able to create and edit cards

  @javascript
  Scenario: Creating a new card
    Given I am logged in
    When I go to "the new card page"
    And I press "Edit"
    And I fill in "ID" with "1337"
    And I fill in "User" with "User Name"
    And I fill in "Nick" with "yoozer"
    And I press "Create Card"
    Then I should see "Card was successfully created"

    When I go to "the cards page"
    And I follow "Edit"
    Then the "card_id" field should contain "1337" 

  @javascript
  Scenario: Creating a new card and capture swipe
    Given I am logged in
    When I go to "the new card page"
    And I press "Capture Card"
    Then I should see "Stop Capture"

    When my card with code "1337" is denied 
    And I wait "3" seconds 
    Then the "card_id" field should contain "1337" 

  @javascript
  Scenario: I can stop capture
    Given I am logged in
    When I go to "the new card page"
    And I press "Capture Card"
    And I press "Stop Capture"
    And I wait "1" seconds 
    Then the "card_id" field should contain "" 
    And I should not find "Stop Capture"
    And I should not find "Capturing"

  Scenario: Editing a card
    Given I am logged in
    And there are cards with the following data:
    | card_id | user        | nick      | 
    | 1337    | Bob Jackson | bojangles |
    And I go to "the home page"
    And I follow "cards"
    And I follow "Edit"
    When I fill in "User" with "User Name"
    And I press "Update Card"
    And I follow "Back"
    Then I should see "User Name"
    And I should not see "Bob Jackson"
