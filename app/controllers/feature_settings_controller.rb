class FeatureSettingsController < ApplicationController
  def new
  end

  def create
  end

  def edit
    @feature = Feature.find params[:id]
    @company_settings = FeatureSetting.where(feature_id: @feature.id, type: 'CompanyFeatureSetting', type_id: current_user.company.id).first
    @user_settings = FeatureSetting.where(feature_id: @feature.id, type: 'UserFeatureSetting', type_id: current_user.id).first
  end

  def update
  end

  def destroy
  end
end
