Feature: A client system

Scenario: A company sees the client form
  Given I am logged in
  Then I should see "Clients"
  And I click the link "Clients" 
  And I click the link "Add a Client"
  Then I should see "Client Info"