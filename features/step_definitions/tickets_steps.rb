Given(/^the following tickets exist:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.symbolic_hashes.each do |row|
    Ticket.create!(row.merge(company_id: @current_user.company_id))
  end
end

Given(/^I click the row "([^"]*)"$/) do |arg1|
  within('table') do
    find('td', text: arg1).click
  end
end
