Feature: User can go from Sign In page to Contact page 
Scenario: Go from Sign In to Contact 
  Given I am on the BooksOnRails signin page
  And I should see a link titled "CONTACT" that goes to "/contact"
  And I follow "CONTACT"
  Then I should be on the BooksOnRails contact page