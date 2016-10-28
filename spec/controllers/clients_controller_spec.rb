require 'rails_helper'

RSpec.describe ClientsController, type: :controller do

  before :each do
    user = FactoryGirl.create(:user1)
    if user && user.authenticate('1234')
      session[:current_user_id] = session[:login_user_id] = user.id
    end
  end

  it "Should not import contacts" do
    request.env['omnicontacts.contacts'] = nil
    get :callback, :params => { provider: 'google_oauth2'}
    expect(flash[:danger]).to eql('Contacts not found!')
  end

  it "Should import contacts" do
    request.env['omnicontacts.contacts'] = [{:id=>"123",
                                            :first_name=>"test",
                                            :last_name=>"test",
                                            :name=>"test test",
                                            :emails=>[{:name=>"other", :email=>"test@gmail.com"}],
                                            :gender=>nil,
                                            :birthday=>nil,
                                            :profile_picture=>"",
                                            :relation=>nil,
                                            :email=>"test@gmail.com"}]
    get :callback, :params => { provider: 'google_oauth2'}
    client = Client.find_by(email: 'test@gmail.com')
    expect(client.blank?).to eql(false)

  end


  describe "POST #create" do
    it 'create client with meta field' do
      client_type = FactoryGirl.create(:client_type)
      metadatum_type = FactoryGirl.create(:metadatum_type)
      metadatum = FactoryGirl.create(:metadatum)
      params =  {client_type_id: client_type.id, company_name: "test company", first_name: "test name", last_name: "test lname", phone: "98754654", fax: "1132311", email: "testemail@mailinator.com", street: "indore", city: "indore", state: "AK", zipcode: "54545", metadata: {test: "test123"}}
      post :create, params: {client: params}

      client = Client.first
      meta_value = client.meta_values.first
      expect(meta_value.value).to eql('test123')
    end
  end
end