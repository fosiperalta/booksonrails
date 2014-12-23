Feature: User can go from Home page to Account page 
Scenario: Go from Home To Account 
	Given I am signed in as user "juanlop" with password "1234"
  Given I am on the BooksOnRails home page
  And I should see a link titled "ACCOUNT" that goes to "/users/1"
  And I follow "ACCOUNT"
  Then I should be on the BooksOnRails juanlop's account page