require 'rails_helper'
RSpec.describe UnitsController, type: :controller do
  before :each do
    user = FactoryGirl.create(:user1)
    if user && user.authenticate('1234')
      session[:current_user_id] = session[:login_user_id] = user.id
    end
  end
  describe "GET #remove_unit" do
    it 'should remove project assigned' do
      unit = FactoryGirl.create(:unit, :with_project)
      request.env["HTTP_REFERER"] = '/projects'
      get :remove_unit, params: {unit_slug: unit.slug}
      unit = Unit.find_by(slug: unit.slug)
      expect(unit.project_id.blank?).to eq(true)
    end
  end

  describe "POST #create_project_unit" do
    it 'should not create unit' do
      unit_category = FactoryGirl.create(:unit_category)
      post :create_project_unit, params: {project_slug: "erwerwe", unit: {client_description: 'test', cost: 100, description: 'test', location_id: nil, manufacturer: 'test', model: 'test', unit_category_id: unit_category.id}}
      expect(flash[:danger].blank?).to eq(false)
    end

    it 'should create unit with project assigned' do
      project = FactoryGirl.create(:project)
      unit_category = FactoryGirl.create(:unit_category)
      post :create_project_unit, params: {project_slug: project.slug, unit: {client_description: 'test', cost: 100, description: 'test', location_id: nil, manufacturer: 'test', model: 'test', unit_category_id: unit_category.id}}
      expect(flash[:success].blank?).to eq(false)
    end
  end
end
