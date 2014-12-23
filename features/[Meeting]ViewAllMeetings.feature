Feature: User can view a list of all meetings
Scenario: View all meetings
 	Given I am signed in as user "juanlop" with password "1234"
	Given there is a meeting created
  Given I am on the Meetings options page
  And I follow "View all available meetings"
  Then I should see "Meeting 1"