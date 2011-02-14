Feature:
  In order to know who has a card
  As an admin
  I need to be able to see all the cards in a listing

  Background:
    Given there are cards with the following data:
    | card_id | user         | nick      | 
    | 1337    | Bob Jackson  | bojangles |
    | 1338    | Jack Johnson | jackles   |

  Scenario: Creating a new card
    Given I am logged in  
    When I go to "the show cards page"
    Then I should see "1337" within "#1337"
    And I should see "Bob Jackson" within "#1337"
    And I should see "bojangles" within "#1337"
    And I should see "1338" within "#1338"
    And I should see "Jack Johnson" within "#1338"
    And I should see "jackles" within "#1338"
