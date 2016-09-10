class Admin::FeaturesController < ApplicationController
  def index
    @features = Feature.all
  end
end
