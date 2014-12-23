Feature: User can logout from Catalog page
Scenario: Logout from Catalog
	Given I am signed in as user "juanlop" with password "1234"
  Given I am on the BooksOnRails catalog page
  And I should see a link titled "LOGOUT" that goes to "/sessions/new"
  And I follow "LOGOUT"
  Then I should be on the BooksOnRails signin page