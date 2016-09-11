class Admin::FeaturesController < ApplicationController
  def index
    @features = Feature.all
  end

  def new
    @feature = Feature.new
  end

  def create
    @feature = Feature.new(feature_params)

    if @feature.save
      flash[:success] = 'Feature created'
      redirect_to admin_features_path
    else
      flash[:danger] = 'Feature could not be created'
      render "new"
    end
  end

  def show
    @feature = Feature.find(params[:id])
  end

  def edit
    @feature = Feature.find(params[:id])
  end

  def destroy
    feature = Feature.find(params[:id])
    feature.delete
    flash[:success] = 'Feature deleted'
    redirect_to admin_features_path
  end

private

  def feature_params
    params.require(:feature).permit(:name, :description, :monthly_price, :settings)
  end
end
