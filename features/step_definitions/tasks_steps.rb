Given(/^the following tasks exist:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.symbolic_hashes.each do |row|
    Task.create!(row.merge(company_id: @current_user.company_id))
  end
end
