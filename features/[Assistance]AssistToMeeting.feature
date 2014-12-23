Feature: User can assist to meeting
Scenario: View all meetings
 	Given I am signed in as user "juanlop" with password "1234"
	Given there is a meeting created
	Given I have one exemplar on My Books
  Given I am on the Meetings options page
  And I follow "View all available meetings"
  And I should see "Meeting 1"
  And I follow "Assist to meeting"
  And I should see "Title: Meeting 1"
  And I should see "Book 1"
  And I press "Take book to meeting"
  Then I should see "book taken"
  And I follow "MEETINGS"
  And I follow "View meetings I'm assisting"
  Then I should see "Meeting 1"
  Then I should see "Book 1"
