Feature: User can add a new book to the catalog
Scenario: Add a New Book to the Catalog
  Given there is a book with title "The Odyssey" and author "Homer" and publisher "Sun Publications"
  Given I am signed in as user "juanlop" with password "1234"
  Given I am on the BooksOnRails home page
  And I should see a link titled "CATALOG" that goes to "/books"
  And I follow "CATALOG"
  And I follow "The Odyssey"
  And I follow "Edit info"
  And I fill in "Publisher" with "Athens Publications"
  And I press "Save Changes"
  Then I should see "Athens Publications"
  And I follow "Back to book list"
  Then I should see "Athens Publications"