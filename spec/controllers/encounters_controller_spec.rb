require 'rails_helper'

RSpec.describe EncountersController, type: :controller do
  before :each do
    user = FactoryGirl.create(:user1)
    if user && user.authenticate('1234')
      session[:current_user_id] = session[:login_user_id] = user.id
    end
  end

  describe "POST #create" do
    it 'Should not create encounter without params' do
      client = FactoryGirl.create(:client)
      encounter_type = FactoryGirl.create(:encounter_type)

      params = { encounter: { client_id: client.id, encounter_date: nil, duration: nil, encounter_type_id: encounter_type.id, notes: nil} } 
      post :create, params: params 
      expect(false).to eql(false)
    end

    it 'Should not create encounter with partial params' do
      client = FactoryGirl.create(:client)
      encounter_type = FactoryGirl.create(:encounter_type)

      params = { encounter: { client_id: client.slug, encounter_date: nil, duration: nil, encounter_type_id: encounter_type.id, notes: nil} } 
      post :create, params: params 
      expect(false).to eql(false)
    end

    it 'Should create encounter' do
      client = FactoryGirl.create(:client)
      encounter_type = FactoryGirl.create(:encounter_type)

      params = { encounter: { client_id: client.slug, encounter_date: '12/09/2016', duration: 1, encounter_type_id: encounter_type.id, notes: "test notes"} }
      post :create, params: params 
      expect(true).to eql(true)
    end
  end

  describe "PATCH #update" do
    it 'Should not update encounter without params' do
      client = FactoryGirl.create(:client)
      encounter_type = FactoryGirl.create(:encounter_type)

      params = { encounter: { client_id: client.slug, encounter_date: '12/09/2016', duration: 1, encounter_type_id: encounter_type.id, notes: "test notes"} }
      post :create, params: params
      encounter = Encounter.first

      params = {slug: encounter.slug, encounter: { client_id: nil, encounter_date: nil, duration: nil, encounter_type_id: encounter_type.id, notes: nil} }
      post :update, params: params 

      expect(response).to render_template(:edit)
    end

    it 'Should not update encounter with partial params' do
      client = FactoryGirl.create(:client)
      encounter_type = FactoryGirl.create(:encounter_type)
      params = { encounter: { client_id: client.slug, encounter_date: '12/09/2016', duration: 1, encounter_type_id: encounter_type.id, notes: "test notes"} }
      post :create, params: params
      encounter = Encounter.first

      params = {slug: encounter.slug, encounter: { client_id: client.slug, encounter_date: nil, duration: nil, encounter_type_id: encounter_type.id, notes: nil} } 
      post :update, params: params
      expect(response).to render_template(:edit)
    end

    it 'Should update encounter' do
      client = FactoryGirl.create(:client)
      encounter_type = FactoryGirl.create(:encounter_type)
      params = { encounter: { client_id: client.slug, encounter_date: '12/09/2016', duration: 1, encounter_type_id: encounter_type.id, notes: "test notes"} }
      post :create, params: params
      encounter = Encounter.first

      params = {slug: encounter.slug, encounter: { client_id: client.slug, encounter_date: '13/09/2016', duration: 1, encounter_type_id: encounter_type.id, notes: "test notes update"} }
      post :update, params: params 
      expect(true).to eql(true)
    end
  end

end