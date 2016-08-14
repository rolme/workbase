When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see the login form$/) do
  expect(page).to have_content("Email")
  expect(page).to have_content("Password")
  expect(page).to have_content("Sign in")
end

When(/^I go to the register page$/) do
  visit register_path
end

When(/^I click "([^"]*)"$/) do |arg1|
  click_button arg1
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

When(/^I go to the login page$/) do
  visit login_path
end

Given(/^the following users exist:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.symbolic_hashes.each do |row|
    # Use the registration form
    form = RegistrationForm.new
    form.submit(row)
  end
end

When(/^I fill in the following:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |row|
    row.each_pair do |key, value|
      fill_in key, :with => value
    end
  end
end
