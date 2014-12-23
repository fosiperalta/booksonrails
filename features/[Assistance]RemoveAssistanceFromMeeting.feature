Feature: User can cancel the assistance to a meeting
Scenario: Cancel assistance to meetinbg
 	Given I am signed in as user "juanlop" with password "1234"
	Given there is a meeting created
  Given I am assisting a meeting
  Given I am on the Meetings options page
  And I follow "View meetings I'm assisting"
  And I should see "Meeting 1"
  And I click OK on the popup
  Then I should see "Assistance to 'Meeting 1' removed"

