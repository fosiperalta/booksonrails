Feature: User can go from Catalog page to Home page 
Scenario: Go from Catalog To Home 
	Given I am signed in as user "juanlop" with password "1234"
  Given I am on the BooksOnRails catalog page
  And I should see a link titled "HOME" that goes to "/home"
  And I follow "HOME"
  Then I should be on the BooksOnRails home page
