Feature: User can go from Account page to Home page 
Scenario: Go from Account To Home 
	Given I am signed in as user "juanlop" with password "1234"
  Given I am on the BooksOnRails juanlop's account page
  And I should see a link titled "HOME" that goes to "/home"
  And I follow "HOME"
  Then I should be on the BooksOnRails home page
