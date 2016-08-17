Then(/^I should see the login form$/) do
  expect(page).to have_content("Email")
  expect(page).to have_content("Password")
  expect(page).to have_content("Sign in")
end

Given(/^the following users exist:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.symbolic_hashes.each do |row|
    # Use the registration form
    form = RegistrationForm.new
    form.submit(row)
  end
end
