Feature: A User must login

Scenario: User is redirected to the login page
  When I go to the homepage
  And I click the link "Login"
  Then I should see the login form

Scenario: A new user can register
  pending
  # This scenario requires comfirming an email has been sent.
  #   When I go to the register page
  #   And I fill in the following:
  #     | Company Name | Email Address       | Password |
  #     | Test Company | demo-admin@test.com | demo     |
  #   And I click "Create"
  #   Then I should see "Test Company"

Scenario: User can log in
  Given the following users exist:
    | Company Name | Email               | Password |
    | Test Company | demo-admin@test.com | demo     |
  When I go to the login page
  And I fill in the following:
    | Email                  | Password |
    | demo-admin@test.com    | demo     |
  And I click "Sign in"
  Then I should see "Test Company"
