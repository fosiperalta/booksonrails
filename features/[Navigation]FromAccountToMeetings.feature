Feature: User can go from Account page to Meetings page 
Scenario: Go from Account To Meetings 
	Given I am signed in as user "juanlop" with password "1234"
  Given I am on the BooksOnRails juanlop's account page
 	And I should see a link titled "MEETINGS"
  And I follow "MEETINGS"
  Then I should be on the Meetings options page