Feature: Remove an exemplar from My Books
Scenario: Remove an Exemplar to My Books
  Given there is a book with title "The Odyssey" and author "Homer" and publisher "Sun Publications"
  Given I am signed in as user "juanlop" with password "1234"
  Given I have an exemplar of The Odyssey
  Given I am on the BooksOnRails home page
  And I should see a link titled "MY BOOKS"
  And I follow "MY BOOKS"
  And I should see "The Odyssey"
  And I press "Remove"
  Then I should see "An exemplar of 'The Odyssey' deleted from My Books."
  And I follow "MY BOOKS"
  Then I should not see "The Odyssey"
