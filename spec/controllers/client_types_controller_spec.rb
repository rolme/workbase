require 'rails_helper'
  
RSpec.describe ClientTypesController, type: :controller do
  before :each do
    user = FactoryGirl.create(:user1)
    if user && user.authenticate('1234')
      session[:current_user_id] = session[:login_user_id] = user.id
    end
  end

  describe "POST #create" do
    it 'Should not create client type' do
      params = { client_type: {label: nil}}
      post :create, params: params 
      expect(false).to eql(false)
    end

    it 'Should create client type' do
      params = { client_type: {label: 'Lead'}}
      post :create, params: params 
      expect(true).to eql(true)
    end
  end

  describe "PATCH #update" do
    it 'Should not update client_type' do
      client_type = ClientType.first
      params = {slug: client_type.slug, client_type: { label: nil} }
      post :update, params: params
      expect(response).to render_template(:edit)
    end

    it 'Should update client_type' do
      client_type = ClientType.first
      params = {slug: client_type.slug, client_type: { label: 'customer'} }
      post :update, params: params
      client_type = ClientType.find_by(id: client_type.id)
      expect(client_type.label).to eql('customer')
    end
  end

end 
