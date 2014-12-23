Feature: User can sign in
Scenario: Sign in
	Given I register one user "juanlop" with email "juanlop@hmail.com" and password "1234"
	Given I am on the BooksOnRails signin page
  When I fill in "Username" with "juanlop"
  And I fill in "Password" with "1234"
  And I press "Sign in"
  Then I should be on the BooksOnRails home page