require 'rails_helper'

RSpec.describe InventoryController, type: :controller do
  before :each do
    user = FactoryGirl.create(:user1)
    if user && user.authenticate('1234')
      session[:current_user_id] = session[:login_user_id] = user.id
    end
  end

  describe "POST #search_unit" do
    it "Should search unit on location basis" do
      admin = FactoryGirl.create(:admin)
      warehouse = FactoryGirl.create(:warehouse, created_by: admin)
      location = FactoryGirl.create(:location, warehouse: warehouse )
      unit = FactoryGirl.create(:unit, location_id: location.id )
      post :search_unit, params: { area_slug: warehouse.slug  , location_id: location.id }
      expect(assigns(:units)).not_to be_nil
    end
  end
end
