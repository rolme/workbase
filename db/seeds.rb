require 'faker'

puts "Add default companies"
Company.create([
  {name: "Workbase"},
  {name: "Spark Lab"}
])

workbase = Company.find_by(name: 'Workbase')
sparklab = Company.find_by(name: 'Spark Lab')

puts "Adding Workbase users"
WorkbaseUser.create([
  { email: "roland@workbase.com", password: "test", password_confirmation: "test", first_name: 'Roland', last_name: 'Parnaso', company: workbase }
])

puts "Adding admins for Spark Lab"
Admin.create([
  { email: "admin@sparklab.io", password: "test", password_confirmation: "test", first_name: 'Admin', last_name: 'SparkLab.io', company: sparklab }
])

puts "Adding users for Spark Lab"
Admin.create([
  { email: "roland@sparklab.io", password: "test", password_confirmation: "test", first_name: 'Roland', last_name: 'SparkLab.io', company: sparklab }
])

puts "Confirm all users."
User.update_all(confirmed: true, confirmation_token: nil)
