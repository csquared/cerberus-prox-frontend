Feature:
  In order to give users access to certain doors
  As an admin
  I need to be able to add users to an Access Group

  @javascript
  Scenario: Adding a card with an access group
    Given there is an Access group called "Front Door"
    And I am logged in
    When I go to "the new card page"
    And I press "Edit"
    And I fill in "ID" with "1337"
    And I fill in "User" with "User Name"
    And I fill in "Nick" with "yoozer"
    And I check "Front Door"
    And I press "Create Card"
    And I follow "Edit"
    Then the "Front Door" checkbox should be checked

    When I uncheck "Front Door"
    And I press "Update Card"
    And I follow "Edit"
    Then the "Front Door" checkbox should not be checked

    When I check "Front Door"
    And I press "Update Card"
    And I follow "Edit"
    Then the "Front Door" checkbox should be checked
