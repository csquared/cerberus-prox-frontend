Feature:
  In order to open doors from the dashboard
  As as admin
  I need links to open the door

@javascript
Scenario: Open door from dashboard
  Given there is a door called "front_door"
  And there is a door called "back_door"
  And I want to open the "front_door"
  When I go to "the home page"
  Then I press "Open the front door"

  And I want to open the "back_door"
  Then I press "Open the back door"
