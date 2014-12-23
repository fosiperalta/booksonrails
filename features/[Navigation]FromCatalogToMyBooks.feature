Feature: User can go from Catalog page to My Books page 
Scenario: Go from Catalog To My Books
	Given I am signed in as user "juanlop" with password "1234"
  Given I am on the BooksOnRails catalog page
  And I should see a link titled "MY BOOKS"
  And I follow "MY BOOKS"
  Then I should be on My Books page