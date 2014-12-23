Feature: User can go from Catalog page to Meetings page 
Scenario: Go from Catalog To Meetings 
	Given I am signed in as user "juanlop" with password "1234"
  Given I am on the BooksOnRails catalog page
 	And I should see a link titled "MEETINGS"
  And I follow "MEETINGS"
  Then I should be on the Meetings options page