Feature:
  In order to add new cards to the system
  As an admin
  I need to be able to create and edit cards

  Scenario: Creating a new card
    Given I am logged in
    When I go to "the new card page"
#    And I fill in "Id" with "XXXXXX"
    And I fill in "User" with "User Name"
    And I fill in "Nick" with "yoozer"
    And I press "Create Card"
    Then I should see "Card was successfully created"
