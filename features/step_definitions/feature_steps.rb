Given(/^the following features exist:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.symbolic_hashes.each do |row|
    Feature.create!(row)
  end
end

Given(/^the following features are enabled:$/) do |table|
  table.symbolic_hashes.each do |row|
    feature = Feature.find_by(name: row[:name])
    @current_user.company.features << feature
  end
end
