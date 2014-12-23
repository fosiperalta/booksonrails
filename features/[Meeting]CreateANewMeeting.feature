Feature: User can create a new meeting 
Scenario: Create a new meeting (ok case)
 	Given I am signed in as user "juanlop" with password "1234"
  Given I am on the Meetings options page
  And I follow "Create new meeting"
  And I fill in "Title" with "Meeting 2"
  And I fill in "Country" with "Spain"
  And I fill in "City" with "Madrid"
  And I fill in "Address" with "Calle Velazquez 2"
  And I press "Save Changes"
  And I should be on the all Meetings page
  Then I should see "Meeting 2"

Scenario: Create a new meeting (name already exists case)
 	Given I am signed in as user "juanlop" with password "1234"
 	Given there is a meeting created
  Given I am on the Meetings options page
  And I follow "Create new meeting"
  And I fill in "Title" with "Meeting 1"
  And I fill in "Country" with "Spain"
  And I fill in "City" with "Madrid"
  And I fill in "Address" with "Calle Velazquez 2"
  And I press "Save Changes"
  Then I should see "Title has already been taken"

Scenario: Create a new meeting (name is blank case)
 	Given I am signed in as user "juanlop" with password "1234"
 	Given there is a meeting created
  Given I am on the Meetings options page
  And I follow "Create new meeting"
  And I press "Save Changes"
  Then I should see "Title can't be blank"