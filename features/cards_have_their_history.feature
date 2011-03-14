Feature:
  In order to know a user's history
  As an admin
  I should see that user's access log when I view their card

Scenario:
  Given there are cards with the following data:
  | card_id | user        | nick      | 
  | 1337    | Bob Jackson | bojangles |

  And there is a door called "front_door"

  When my card with code "1337" is denied from the "front_door" 
  And my card with code "1338" is denied 
  And I go to "the home page"
  And I follow "cards"
  And I follow "Show"
  
  Then I should see "DENY"
  And I should see "doesn't have access to front_door"
