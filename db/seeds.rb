require 'faker'

puts "Add Spark Lab"
company = Company.create(name: "Spark Lab")

puts "Adding Admins"
Admin.create([
  { email: "admin@sparklab.io", password: "test", password_confirmation: "test", first_name: 'Admin', last_name: 'SparkLab.io', company: company}
])
