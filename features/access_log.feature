Feature:
  In order to know who has been at the HackerSpace
  As an admin
  I need to have an access log

  Scenario: Access log is viewable  
    Given there are cards with the following data:
    | card_id | user        | nick      | 
    | 1337    | Bob Jackson | bojangles |

    When my card with code "1337" is denied 
    And my card with code "1338" is denied 
    And I go to "the access log"
    Then I should see "Bob Jackson"
    And I should see "1338"
    And I should see "Add Card"

    When I follow "Show"
    Then I should see /133[7|8]/
