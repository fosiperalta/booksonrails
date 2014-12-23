Feature: External person can register a new account
Scenario: Register a new user
  Given I am on the BooksOnRails signin page
  When I follow "Register"
  And I should be on the BooksOnRails register page
  And I fill in "First Name" with "Juan"
  And I fill in "Second Name" with "Lopez"
  And I fill in "Username" with "juanlop"
  And I fill in "Email" with "juanlop@hmail.com"
  And I fill in "Password" with "1234"
  And I press "Register"
  Then I should be on the BooksOnRails signin page
