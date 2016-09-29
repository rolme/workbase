Then(/^a field type is selected$/) do 
  page.select('textfield', from: 'Field type')
end

Then(/^a client type is selected$/) do 
  page.select('lead', from: 'client[client_type_id]')
end

Then(/^a state is selected$/) do 
  page.select('Alaska', from: 'State')
end

Then(/^I pause for a while$/) do
  sleep 5
end