Feature: User can go from Account page to Catalog page 
Scenario: Go from Account To Catalog 
	Given I am signed in as user "juanlop" with password "1234"
  Given I am on the BooksOnRails home page
  And I follow "ACCOUNT"
  And I should see a link titled "CATALOG" that goes to "/books"
  And I follow "CATALOG"
  Then I should be on the BooksOnRails catalog page
