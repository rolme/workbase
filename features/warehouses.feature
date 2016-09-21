Feature: A warehouse system

Scenario: A user sees the warehouse list
  Given I am logged in
  Then I should see "Inventory"

Scenario: A user can view the warehouses index
  Given I am logged in
  And I click the link "Inventory"
  And I click the link "Warehouses"
  Then I should see "Add a Warehouse"