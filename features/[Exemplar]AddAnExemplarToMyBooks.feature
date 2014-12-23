Feature: User can add an exemplar of a book to "my books"
Scenario: Add a non-existent Exemplar to My Books
  Given there is a book with title "The Odyssey" and author "Homer" and publisher "Sun Publications"
  Given I am signed in as user "juanlop" with password "1234"
  Given I am on the BooksOnRails home page
  And I should see a link titled "CATALOG" that goes to "/books"
  And I follow "CATALOG"
  And I press "Add to My Books"
  Then I should see "Book 'The Odyssey' has been added to My Books."
  And I follow "MY BOOKS"
  Then I should see "The Odyssey"

Scenario: Add an existent Exemplar to My Books
  Given there is a book with title "The Odyssey" and author "Homer" and publisher "Sun Publications"
  Given I am signed in as user "juanlop" with password "1234"
  Given I am on the BooksOnRails home page
  And I should see a link titled "CATALOG" that goes to "/books"
  And I follow "CATALOG"
  And I press "Add to My Books"
  And I press "Add to My Books"
  Then I should see "Book 'The Odyssey' was already in My Books."
  And I follow "MY BOOKS"
  Then I should see "The Odyssey"