Feature: The site store

Scenario: There are no site features
  Given I am logged in
  Then I should see "Add-ons Store"
  And I click the link "Add-ons Store"
  Then I should see "No site features enabled"

Scenario: There is one site feature and it isn't enabled for anyone
  Given the following features exist:
    | Name                 | Description       | Monthly Price | Settings |
    | Inventory Management | Lore ipsum dolor. | 25.0          |          |
  Given I am logged in
  Then I should see "Add-ons Store"
  And I click the link "Add-ons Store"
  Then I should see "Inventory Management"
  And I should see "Not Enabled"


Scenario: There is one site feature and it is enabled for everyone
  Given I am logged in
  Given the following features exist:
    | Name                 | Description       | Monthly Price | Settings |
    | Inventory Management | Lore ipsum dolor. | 25.0          |          |
  Given the following features are enabled:
    | Name                 |
    | Inventory Management |
  Then I should see "Add-ons Store"
  And I click the link "Add-ons Store"
  Then I should see "Inventory Management"
  And I should not see "Not Enabled"
