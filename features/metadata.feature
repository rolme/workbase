Feature: A metadata system

Scenario: A user sees the settings page
  Given I am logged in
  Then I should see "Settings"

Scenario: A user can view the settings index
  Given I am logged in
  And I click the link "Settings"
  And I click the link "Metadata"
  And I click the link "Add a Metadata"
  Then I should see "Metadata List"

Scenario: A comapny can create a metadatum
  Given I am logged in
  And I click the link "Settings"
  And I click the link "Metadata"
  And I click the link "Add a Metadata"
  Then I should see "Metadata List"
  Then a field type is selected
  And I fill in the following:
    |  Meta Name              |
    |  testunique                  | 
  And I click "Create Metadatum"
  Then I should see "Add a Metadata"
  And I click the link "Clients" 
  And I click the link "Add a Client"
  Then a client type is selected
  Then a state is selected
  And I fill in the following:
    |Company name    | First name |Last name|  Phone  |  Email               | Street | City | Zipcode |
    |new test_company|firstname   |lastname |65454    |testnew@mailinator.com| test5 street | testcity | 55555 |