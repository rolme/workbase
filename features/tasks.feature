Feature: A company task list

Scenario: A user sees the Tasks menu item
  Given I am logged in
  Then I should see "Tasks"

@javascript
Scenario: A user can view the task list
  Given I am logged in
  And I click the link "Tasks"
  Then I should see "Tasks"
  Then I should see "Task List"
  Then I should see "Your current tasks are listed below."

@javascript
Scenario: A user can create a task
  Given I am logged in
  And I click the link "Tasks"
  And I click "Add"
  And I fill in the following:
    | title        | due_at     |
    | A task to do | 10/10/2020 |
  And I click the "save" icon
  Then I should see "Task saved"
  And I should see "A task to do"

@javascript
Scenario: A user can edit a task
  Given I am logged in
  And the following tasks exist:
    | title        | due_at     |
    | A task to do | 10/10/2020 |
  And I click the link "Tasks"
  Then I should see "A task to do"
  And I click the "pencil-square-o" icon
  And I fill in the following:
    | title             |
    | A task to do ASAP |
  And I click the "save" icon
  Then I should see "Task saved"
  And I should see "A task to do ASAP"

@javascript
Scenario: A user can delete a task
  Given I am logged in
  And the following tasks exist:
    | title        | due_at     |
    | A task to do | 10/10/2020 |
  And I click the link "Tasks"
  Then I should see "A task to do"
  And I click the "trash" icon
  Then I should not see "A task to do"
