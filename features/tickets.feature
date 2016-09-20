Feature: A ticketing system

Scenario: A user sees the Tickets menu item
  Given I am logged in
  Then I should see "Tickets"

Scenario: A user can view the tickets index
  Given I am logged in
  And I click the link "Tickets"
  Then I should see "Tickets"
  Then I should see "No tickets"

Scenario: A user can create a ticket
  Given I am logged in
  And I click the link "Tickets"
  And I click the link "Add a Ticket"
  And I fill in the following:
    | Title      | Description              |
    | New Ticket | A new ticket description |
  And I click "Create Ticket"
  Then I should see "Ticket created"
  And I should see "New Ticket"

@javascript
Scenario: A user can edit a ticket
  Given I am logged in
  And the following tickets exist:
    | Title      | Description              |
    | New Ticket | A new ticket description |
  And I click the link "Tickets"
  And I click the row "New Ticket"
  Then I should see "New Ticket"
  And I click the link "Edit"
  And I fill in the following:
    | Title             |
    | An Updated Ticket |
  And I click "Update Ticket"
  Then I should see "Ticket updated"
  And I should see "An Updated Ticket"

@javascript
Scenario: A user can delete a ticket
  Given I am logged in
  And the following tickets exist:
    | Title      | Description              |
    | New Ticket | A new ticket description |
  And I click the link "Tickets"
  And I click the row "New Ticket"
  And I click the link "Delete"
  And I confirm the dialog
  Then I should see "Ticket deleted"
  And I should see "No tickets"
