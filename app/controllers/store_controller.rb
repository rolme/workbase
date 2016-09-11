class StoreController < ApplicationController
  def index
    @settings = current_user.company.settings
    @features = Feature.active.all
  end
end
