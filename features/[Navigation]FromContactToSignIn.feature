Feature: User can go from Contact page to Sign In page 
Scenario: Go from Contact to Sign In 
  Given I am on the BooksOnRails contact page
  And I should see a link titled "SIGN IN" that goes to "/sessions/new"
  And I follow "SIGN IN"
  Then I should be on the BooksOnRails signin page