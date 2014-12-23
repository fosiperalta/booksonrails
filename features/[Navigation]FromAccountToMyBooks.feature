Feature: User can go from Account page to My Books page 
Scenario: Go from Account To My Books 
	Given I am signed in as user "juanlop" with password "1234"
  Given I am on the BooksOnRails juanlop's account page
 	And I should see a link titled "MY BOOKS"
  And I follow "MY BOOKS"
  Then I should be on My Books page