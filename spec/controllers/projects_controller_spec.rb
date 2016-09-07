require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before :each do
    user = FactoryGirl.create(:user1)
    if user && user.authenticate('1234')
      session[:current_user_id] = session[:login_user_id] = user.id
    end
  end

  describe "POST #new_project_unit" do

    it 'Should not add unit' do
      project = FactoryGirl.create(:project)
      post :new_project_unit, params: {project_slug: project.slug, unit: {slug: "123123"}}
      expect(flash[:danger]).to eq('Item not found')
    end

    it 'Should add unit' do
      unit = FactoryGirl.create(:unit)
      project = FactoryGirl.create(:project)
      post :new_project_unit, params: {project_slug: project.slug, unit: {slug: unit.slug}}
      unit = Unit.find_by(slug: unit.slug)
      expect(unit.project_id.blank?).to eq(false)
    end
  end
end
