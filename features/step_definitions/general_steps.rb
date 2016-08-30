Given(/^I am logged in$/) do
  row = {
    company_name: 'Test Company',
    email: 'demo-admin@test.com',
    password: 'demo',
  }

  form = RegistrationForm.new
  form.submit(row)

  @current_user = User.find_by(email: 'demo-admin@test.com')
  @current_user.confirmed = true
  @current_user.confirmation_token = nil
  @current_user.save

  visit login_path

  row.except(:company_name).each_pair do |key, value|
    begin
      fill_in key.to_s.titlecase, :with => value
    rescue
      select value, from: key.to_s.titlecase
    end
  end

  click_button "Sign in"

  visit root_path
end

When(/^I go to the homepage$/) do
  visit root_path
end


When(/^I go to the register page$/) do
  visit register_path
end

When(/^I click "([^"]*)"$/) do |arg1|
  click_button arg1
end

When(/^I click the link "([^"]*)"$/) do |arg1|
  click_link arg1
end

Given(/^I confirm the dialog$/) do
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

When(/^I go to the login page$/) do
  visit login_path
end


When(/^I fill in the following:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |row|
    row.each_pair do |key, value|
      fill_in key, :with => value
    end
  end
end
