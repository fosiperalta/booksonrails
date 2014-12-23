Feature: User can add a new book to the catalog
Scenario: Add a New Book to the Catalog (new isbn)
  Given I am signed in as user "juanlop" with password "1234"
  Given I am on the BooksOnRails home page
  And I should see a link titled "CATALOG" that goes to "/books"
  And I follow "CATALOG"
  And I follow "Add new book"
  And I fill in "Title" with "The Odyssey"
  And I fill in "Author" with "Homer"
  And I fill in "Publisher" with "Sun Publications"
  And I select "English" from "Language"
  And I fill in "isbn10" with "1234567890" 
  And I fill in "isbn13" with "1234567890123"
  And I fill in "Summary" with "Greek epic poem"
  And I press "Save Changes"
  And I should be on the BooksOnRails catalog page
  Then I should see "The Odyssey"
  Then I should see "Homer"
  Then I should see "Sun Publications"

Scenario: Scenario: Add a New Book to the Catalog (existing isbn)
  Given I am signed in as user "juanlop" with password "1234"
  Given I am on the BooksOnRails home page
  Given The Odyssey is in the Catalog
  And I should see a link titled "CATALOG" that goes to "/books"
  And I follow "CATALOG"
  And I follow "Add new book"
  And I fill in "Title" with "The Odyssey"
  And I fill in "Author" with "Homer"
  And I fill in "Publisher" with "Sun Publications"
  And I select "English" from "Language"
  And I fill in "isbn10" with "1234567890" 
  And I fill in "isbn13" with "1234567890123"
  And I fill in "Summary" with "Greek epic poem"
  And I press "Save Changes"
  Then I should see "Errors prevented this book from being created"