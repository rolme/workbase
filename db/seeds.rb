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
  { label: 'active' },
  { label: 'inactive' }
])

ProjectStatus.create([
  { label: 'active' },
  { label: 'hold' },
  { label: 'closed' },
  { label: 'archived' }
])

SectionType.create([
  { label: 'WYSIWYG' },
  { label: 'attachments' },
  { label: 'materials' }
])

ClientType.create([
  { label: 'lead' },
  { label: 'customer' },
  { label: 'follow_up' }
])

SecurityQuestion.create([
  { label: 'What is the name of your first pet?' },
  { label: 'What is the name of your favorite sports team?' },
  { label: 'What is the name of your high school mascot?' },
  { label: 'What city did you meet your significant other?' },
  { label: 'What was the model of your first car?' }
])

puts "done"

puts ""
puts ">> Setup City101 demo"
company = Company.create({name: 'City101'})
puts ">> adding users..."
admin   = Admin.create(first_name: 'Michael', last_name: 'Aguda', email: "demo-admin@city101.net", password: "demo", password_confirmation: "demo", company: company)
user    = User.create(first_name: 'Joseph', last_name: 'Estrella', email: "demo-user@city101.net", password: "demo", password_confirmation: "demo", company: company)
user2   = User.create(first_name: 'Yam', last_name: 'Zara', email: 'walmozara@gmail.com', password: "demo", password_confirmation: "demo", company: company)
User.update_all(confirmed: true, confirmation_token: nil)

puts ">> adding tickets ..."
Ticket.create!(title: 'Houston, we\'ve had a problem', description: 'There is no video feed from the exterior camera at the rear door.', company_id: company.id, submitted_by_name: 'John Swigert', submitted_by_email: 'john@city101.com', submitted_by_company: 'City 101')
Ticket.create!(title: 'Forgot Login Information', description: 'Please assist with password reset.', company_id: company.id, status: 2, viewed_by: admin.id, assigned_to: user.id, submitted_by_name: 'John Swigert', submitted_by_email: 'john@city101.com', submitted_by_company: 'City 101')

puts ">> adding meta data"
ProposalStatus.create([
  { label: 'draft', company: company },
  { label: 'final', company: company },
  { label: 'submitted', company: company },
  { label: 'approved', company: company },
  { label: 'rejected', company: company },
  { label: 'cancelled', company: company },
  { label: 'completed', company: company }
])

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
client = Client.create(company_name: 'Freight King, Inc.', street: '1143 Pacific St.', city: 'Union City', state: 'CA', zipcode: '94587', first_name: 'Kuldip', last_name: 'Badwal', phone: '4085995730', fax: '4084251616', email: 'info@freightking.us', company_id: company.id)


puts ">> creating project for client..."
project = Project.new(name: 'Video Surveillance Installation', start_date: DateTime.now, end_date: nil, client: client, company: company)
project.created_by_id = admin.id
project.save

puts ">> set proposal info..."
project.proposal.update_attribute(:title, 'Surveillance Installation')

Section.create(
  proposal: project.proposal,
  header: 'Project Scope & Summary',
  section_type: SectionType.find_by(label: 'WYSIWYG'),
  data: "<ol><li>Complete wiring, mounting, positioning, lens optimization, channel-by-channel programming and testing of (6) Professional Grade Security Cameras: (3) High Definition 2.0 Megapixel HD1080P IR Vandal Dome Camera &amp; (3) High Definition 2.0 Megapixel HD1080P IR Large Bullet Camera. All cameras will have their own unique presets which will be programmed individually including motion detection, privacy masking, point patrol (if capable), etc. Installation covers various interior and exterior areas of the property (refer to Overview Map)</li><li>All cameras will be hard wired to their assigned Video Server/Power Supply using Coax/CAT6 cabling with specific end-to-end connectors/adapters/terminations. Existing wiring will be utilized or repaired when possible. New wiring will be installed only as necessary</li><li>Custom Configuration of (1) 16-Channel Network Video Server w/ total of 4 Terabytes of Storage – more cameras, video servers, storage and optional peripherals may be added in the future</li><li>Installation and Configuration of (1) Uninterruptible Power Supply Battery Backup Unit for system extended runtime in case of power outage</li><li>Installation and Configuration of (1) 8-Port Power Supply Box to power cameras</li><li>Installation and Configuration of up to (1) Network Gigabit Switch/WAP for network connectivity</li><li>Installation of up to (6) Special Camera Mounts for cameras as necessary</li><li>Installation and Configuration of Power Adapter(s) as necessary</li><li>Installation and configuration of Client Software (included for up to (5) devices – PC, Mac, Laptop, iPhone, Android, Tablets, etc.) for management/staff/authorized users. Please contact your Account Manager if additional devices and/or users need to be setup or added. The program can be used to view live feeds, playback videos, take pictures and other custom control*</li></ol>"
)

puts ">> adding materials to project..."
company.units.each do |unit|
  unit.update_attribute(:project_id, project.id)
end

puts "City101 DONE"

puts ""
puts ">> Setup Tri-City demo"
company = Company.create({name: 'Tri-City Health Center'})
puts ">> adding users..."
admin   = Admin.create(first_name: 'Wilfredo', last_name: 'Lacro', email: "demo@tri-cityhealth.org", password: "demo", password_confirmation: "demo", company: company)
User.update_all(confirmed: true, confirmation_token: nil)

puts ">> adding meta data"
ProposalStatus.create([
  { label: 'Draft', company: company },
  { label: 'Final', company: company }
])

puts ">> adding locations..."
warehouse = Warehouse.create(
  name: 'Office',
  street: '40910 Fremont Blvd.',
  city: 'Fremont',
  state: 'CA',
  zipcode: '94538',
  created_by_id: admin.id,
  company: company
)
location = Location.create(name: 'storage', warehouse: warehouse, created_by_id: admin.id, company: company)

puts ">> adding inventory..."
UnitCategory.create([
  { label: 'table', company: company },
  { label: 'chair', company: company },
  { label: 'work surface', company: company },
  { label: 'legs', company: company },
  { label: 'cabinet', company: company }
])

Unit.create([
  { unit_category_id: UnitCategory.find_by(label: 'table').id, manufacturer: 'Ikea', model: 'DS-7316HQHI-SH 4TB', description: '12\' medical table', client_description: 'Professional Grade Medical Table', cost: 4000.0, procurement_status: 'ordering', company: company },
  { unit_category_id: UnitCategory.find_by(label: 'chair').id, manufacturer: 'Ikea', model: 'DS-2CE56D5T-AVPIR3', description: 'examiner reclining chair', client_description: 'Reclinable patient chair white', cost: 6140.0, location_id: location.id, company: company },
  { unit_category_id: UnitCategory.find_by(label: 'chair').id, manufacturer: 'Ikea', model: 'DS-2CE56D5T-AVPIR3', description: 'examiner reclining chair', client_description: 'Reclinable patient chair white', cost: 6140.0, location_id: location.id, company: company },
  { unit_category_id: UnitCategory.find_by(label: 'chair').id, manufacturer: 'Ikea', model: 'DS-2CE56D5T-AVPIR3', description: 'examiner reclining chair', client_description: 'Reclinable patient chair white', cost: 6140.0, procurement_status: 'ordering', company: company },
  { unit_category_id: UnitCategory.find_by(label: 'chair').id, manufacturer: 'Ikea', model: 'DS-2CE16D5T-AVFIT3', description: 'stool with wheels', client_description: 'Medical stool with wheels', cost: 1140.0, location_id: location.id, company: company },
  { unit_category_id: UnitCategory.find_by(label: 'chair').id, manufacturer: 'Ikea', model: 'DS-2CE16D5T-AVFIT3', description: 'stool with wheels', client_description: 'Medical stool with wheels', cost: 1140.0, location_id: location.id, company: company },
  { unit_category_id: UnitCategory.find_by(label: 'chair').id, manufacturer: 'Ikea', model: 'DS-2CE16D5T-AVFIT3', description: 'stool with wheels', client_description: 'Medical stool with wheels', cost: 1140.0, location_id: location.id, company: company },
  { unit_category_id: UnitCategory.find_by(label: 'cabinet').id, manufacturer: 'Ikea', model: 'DS-2CE56D1T-VPIR 2.8mm', description: '4 shelf white glass cabinet', client_description: '4 shelf white glass cabinet', cost: 1080.0, location_id: location.id, company: company }
])
puts ">> DONE"
