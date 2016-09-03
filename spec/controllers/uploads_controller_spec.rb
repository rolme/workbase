require 'rails_helper'

RSpec.describe UploadsController, type: :controller do

  before :each do
    user = FactoryGirl.create(:user1)
    if user && user.authenticate('1234')
      session[:current_user_id] = session[:login_user_id] = user.id
    end
  end

  it "Should upload a image" do
    expect { post :create, :params => {:upload => FactoryGirl.attributes_for(:upload)} }.to change(Upload, :count).by(1)
    # expect(upload.valid?).to eql(true)
  end

  it "Should delete a image" do
    upload = FactoryGirl.create(:upload)
    delete :destroy, params: {id: upload.id}
    upload = Upload.find_by_id upload.id
    expect(upload.blank?).to eql(true)
  end
end