class StoreController < ApplicationController
  def index
    @settings = current_user.company.settings
    @features = Feature.active.all.sort_by{ |f| @settings.exists?(feature_id: f.id) ? 1 : 0 }
  end
end
