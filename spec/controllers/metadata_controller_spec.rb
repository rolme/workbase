require 'rails_helper'
  
RSpec.describe MetadataController, type: :controller do
  before :each do
    user = FactoryGirl.create(:user1)
    if user && user.authenticate('1234')
      session[:current_user_id] = session[:login_user_id] = user.id
    end
  end

  describe "POST #create" do
    it 'does not create metadatum' do
      params = { metadatum: {label: nil, metadatum_type_id: nil}}
      post :create, params: params 
      expect(response).to render_template(:new)
    end

    it 'create metadatum' do
      metadatum_type = FactoryGirl.create(:metadatum_type)
      params = { metadatum: {label: 'test', metadatum_type_id: metadatum_type.id}}
      post :create, params: params
      expect(response).to render_template(:index)
    end
  end

  describe "PATCH #update" do
    it 'does not update ' do
      metadatum_type = FactoryGirl.create(:metadatum_type)
      metadatum = FactoryGirl.create(:metadatum)
      params = {slug: metadatum.slug, metadatum: { label: nil} }
      post :update, params: params
      expect(response).to render_template(:edit)
    end

    it 'update metadatum' do
      metadatum_type = FactoryGirl.create(:metadatum_type)
      metadatum = FactoryGirl.create(:metadatum)
      params = {slug: metadatum.slug, metadatum: { label: 'testarea'} }
      post :update, params: params
      metadatum = Metadatum.find_by(id: metadatum.id)
      expect(metadatum.label).to eql('testarea')
    end
  end

end 
