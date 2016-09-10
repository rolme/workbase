class StoreController < ApplicationController
  def index
    @settings = current_user.company.settings
    @features = Feature.all
  end
end
