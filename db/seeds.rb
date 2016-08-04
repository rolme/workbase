require 'faker'

puts "Adminstrative Setup... "
Company.create(name: "Workbase")
workbase = Company.find_by(name: 'Workbase')
WorkbaseEmployee.create([
  { email: "admin@workbase.com", password: "test", password_confirmation: "test", first_name: 'Roland', last_name: 'Parnaso', company: workbase }
])
User.update_all(confirmed: true, confirmation_token: nil)

State.create([
  { name: "Alabama", abbreviation: "AL" },
  { name: "Alaska", abbreviation: "AK" },
  { name: "Arizona", abbreviation: "AZ" },
  { name: "Arkansas", abbreviation: "AR" },
  { name: "California", abbreviation: "CA" },
  { name: "Colorado", abbreviation: "CO" },
  { name: "Connecticut", abbreviation: "CT" },
  { name: "Delaware", abbreviation: "DE" },
  { name: "District of Columbia", abbreviation: "DC" },
  { name: "Florida", abbreviation: "FL" },
  { name: "Georgia", abbreviation: "GA" },
  { name: "Hawaii", abbreviation: "HI" },
  { name: "Idaho", abbreviation: "ID" },
  { name: "Illinois", abbreviation: "IL" },
  { name: "Indiana", abbreviation: "IN" },
  { name: "Iowa", abbreviation: "IA" },
  { name: "Kansas", abbreviation: "KS" },
  { name: "Kentucky", abbreviation: "KY" },
  { name: "Louisiana", abbreviation: "LA" },
  { name: "Maine", abbreviation: "ME" },
  { name: "Montana", abbreviation: "MT" },
  { name: "Nebraska", abbreviation: "NE" },
  { name: "Nevada", abbreviation: "NV" },
  { name: "New Hampshire", abbreviation: "NH" },
  { name: "New Jersey", abbreviation: "NJ" },
  { name: "New Mexico", abbreviation: "NM" },
  { name: "New York", abbreviation: "NY" },
  { name: "North Carolina", abbreviation: "NC" },
  { name: "North Dakota", abbreviation: "ND" },
  { name: "Ohio", abbreviation: "OH" },
  { name: "Oklahoma", abbreviation: "OK" },
  { name: "Oregon", abbreviation: "OR" },
  { name: "Maryland", abbreviation: "MD" },
  { name: "Massachusetts", abbreviation: "MA" },
  { name: "Michigan", abbreviation: "MI" },
  { name: "Minnesota", abbreviation: "MN" },
  { name: "Mississippi", abbreviation: "MS" },
  { name: "Missouri", abbreviation: "MO" },
  { name: "Pennsylvania", abbreviation: "PA" },
  { name: "Rhode Island", abbreviation: "RI" },
  { name: "South Carolina", abbreviation: "SC" },
  { name: "South Dakota", abbreviation: "SD" },
  { name: "Tennessee", abbreviation: "TN" },
  { name: "Texas", abbreviation: "TX" },
  { name: "Utah", abbreviation: "UT" },
  { name: "Vermont", abbreviation: "VT" },
  { name: "Virginia", abbreviation: "VA" },
  { name: "Washington", abbreviation: "WA" },
  { name: "West Virginia", abbreviation: "WV" },
  { name: "Wisconsin", abbreviation: "WI" },
  { name: "Wyoming", abbreviation: "WY" }
])

CompanyStatus.create([
  { label: 'trial' },
  { label: 'member' },
  { label: 'deactived' }
])
puts "done"

puts ""
puts ">> Setup City101 demo"
company = Company.create({name: 'City101'})
puts ">> adding users..."
admin   = Admin.create(first_name: 'Michael', last_name: 'Aguda', email: "demo-admin@city101.net", password: "demo", password_confirmation: "demo", company: company)
user    = User.create(first_name: 'Joseph', last_name: 'Estrella', email: "demo-user@city101.net", password: "demo", password_confirmation: "demo", company: company)
User.update_all(confirmed: true, confirmation_token: nil)

puts ">> adding locations..."
warehouse = Warehouse.create(
  name: 'Office',
  street: '5450 Thornwood Dr',
  city: 'San Jose',
  state: 'CA',
  zipcode: '95123',
  created_by_id: admin.id,
  company: company
)
location = Location.create(name: 'storage', warehouse: warehouse, created_by_id: admin.id, company: company)

puts ">> adding inventory..."
UnitCategory.create([
  { label: 'camera', company: company },
  { label: 'dvr', company: company },
  { label: 'switch', company: company },
  { label: 'battery backup', company: company },
  { label: 'power supply box', company: company },
  { label: 'wall mount', company: company },
  { label: 'mouse', company: company }
])

Unit.create([
  { unit_category_id: UnitCategory.find_by(label: 'dvr').id, manufacturer: 'Hikvision', model: 'DS-7316HQHI-SH 4TB', description: '16+2 ip ch hd-tvi dvr w/ 4TB', client_description: 'Professional Grade 16-Channel Network Turbo HD Video Server w/ 4TB of Storage', cost: 600.0, procurement_status: 'ordering', company: company },
  { unit_category_id: UnitCategory.find_by(label: 'camera').id, manufacturer: 'Hikvision', model: 'DS-2CE56D5T-AVPIR3', description: '2mp hd-tvi 1080p vf wdr dome camera', client_description: 'High Definition 2.0 Megapixel Full HD1080P Varifocal WDR Vandal Dome Camera w/ 130’ IR', cost: 140.0, location_id: location.id, company: company },
  { unit_category_id: UnitCategory.find_by(label: 'camera').id, manufacturer: 'Hikvision', model: 'DS-2CE56D5T-AVPIR3', description: '2mp hd-tvi 1080p vf wdr dome camera', client_description: 'High Definition 2.0 Megapixel Full HD1080P Varifocal WDR Vandal Dome Camera w/ 130’ IR', cost: 140.0, location_id: location.id, company: company },
  { unit_category_id: UnitCategory.find_by(label: 'camera').id, manufacturer: 'Hikvision', model: 'DS-2CE56D5T-AVPIR3', description: '2mp hd-tvi 1080p vf wdr dome camera', client_description: 'High Definition 2.0 Megapixel Full HD1080P Varifocal WDR Vandal Dome Camera w/ 130’ IR', cost: 140.0, procurement_status: 'ordering', company: company },
  { unit_category_id: UnitCategory.find_by(label: 'camera').id, manufacturer: 'Hikvision', model: 'DS-2CE16D5T-AVFIT3', description: '2mp hd-tvi 1080p vf wdr bullet camera', client_description: 'High Definition 2.0 Megapixel Full HD1080P Varifocal WDR Large Bullet Camera w/ 150’ IR', cost: 140.0, location_id: location.id, company: company },
  { unit_category_id: UnitCategory.find_by(label: 'camera').id, manufacturer: 'Hikvision', model: 'DS-2CE16D5T-AVFIT3', description: '2mp hd-tvi 1080p vf wdr bullet camera', client_description: 'High Definition 2.0 Megapixel Full HD1080P Varifocal WDR Large Bullet Camera w/ 150’ IR', cost: 140.0, location_id: location.id, company: company },
  { unit_category_id: UnitCategory.find_by(label: 'camera').id, manufacturer: 'Hikvision', model: 'DS-2CE16D5T-AVFIT3', description: '2mp hd-tvi 1080p vf wdr bullet camera', client_description: 'High Definition 2.0 Megapixel Full HD1080P Varifocal WDR Large Bullet Camera w/ 150’ IR', cost: 140.0, location_id: location.id, company: company },
  { unit_category_id: UnitCategory.find_by(label: 'camera').id, manufacturer: 'Hikvision', model: 'DS-2CE56D1T-VPIR 2.8mm', description: '2mp hd-tvi 1080p 2.8mm fixed lens dome camera', client_description: 'High Definition 2.0 Megapixel Full HD1080P Fixed Dome Camera', cost: 80.0, location_id: location.id, company: company },
  { unit_category_id: UnitCategory.find_by(label: 'switch').id, manufacturer: 'TRENDnet', model: 'TEG-S80g', description: '8 port Gb Switch', client_description: '8/4-Port Network Gigabit Switch/WAP', cost: 40.0, location_id: location.id, company: company },
  { unit_category_id: UnitCategory.find_by(label: 'battery backup').id, manufacturer: 'Cyberpower', model: nil, description: '500va UPS battery backup floor unit', client_description: 'UPS Battery Backup Unit', cost: 50.0, location_id: location.id, company: company },
  { unit_category_id: UnitCategory.find_by(label: 'power supply box').id, manufacturer: 'WBOX', model: '0E-1205AD9', description: '8-port power supply box AC 12V ptc', client_description: '8-Port Power Supply Box', cost: 50.0, location_id: location.id, company: company },
  { unit_category_id: UnitCategory.find_by(label: 'mouse').id, manufacturer: 'Hp', model: nil, description: 'Wireless Optical Laser Mouse', client_description: 'Wireless Optical Laser Mouse', cost: 20.0, procurement_status: 'processing', company: company }
])

puts ">> adding client..."
client = Client.create(company_name: 'Freight King, Inc.', street: '1143 Pacific St.', city: 'Union City', state: 'CA', zipcode: '94587', first_name: 'Kuldip', last_name: 'Badwal', phone: '4085995730', fax: '4084251616', email: 'info@freightking.us', company: company)

puts ">> creating project for client..."
project = Project.create(name: 'Video Surveillance Installation', start_date: DateTime.now, end_date: nil, client: client, company: company)

puts ">> adding materials to project..."
company.units.each do |unit|
  unit.update_attribute(:project_id, project.id)
end
puts ">> DONE"
