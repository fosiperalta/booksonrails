Feature: User can go from Home page to Meetings page 
Scenario: Go from Home To Meetings 
	Given I am signed in as user "juanlop" with password "1234"
  Given I am on the BooksOnRails home page
  And I should see a link titled "MEETINGS"
  And I follow "MEETINGS"
  Then I should be on the Meetings options page