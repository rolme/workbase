Feature: A metadata system

Scenario: A user sees the settings page
  Given I am logged in
  Then I should see "Settings"

Scenario: A user can view the settings index
  Given I am logged in
  And I click the link "Settings"
  And I click the link "ClientInfo"
  And I click the link "Add a ClientInfo"
  Then I should see "ClientInfo List"

Scenario: A comapny can create a metadatum
  Given I am logged in
  And I click the link "Settings"
  And I click the link "ClientInfo"
  And I click the link "Add a ClientInfo"
  Then I should see "ClientInfo List"
  Then a field type is selected
  And I fill in the following:
    |  Label              |
    |  birthdate             | 
  And I click "Create Metadatum"
  Then I should see "Add a ClientInfo"
  And I click the link "Clients" 
  And I click the link "Add a Client"
  Then a client type is selected
  Then a state is selected
  And I fill in the following:
    |Company name    | First name |Last name|  Phone  |  Email               | Street | City | Zipcode |  client[metadata][birthdate] |
    |new test_company|firstname   |lastname |65454    |testnew@mailinator.com| test5 street | testcity | 55555 | test meta |