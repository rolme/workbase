class LocationsController < ApplicationController
  def new
    @warehouse = Warehouse.find params[:warehouse_id]
    @location = Location.new
  end

  def create
    @warehouse = Warehouse.find params[:warehouse_id]
    @location = Location.new(location_params.merge(company_id: current_user.company_id, created_by_id: current_user.id, parent_id: @warehouse.id))

    if @location.save
      redirect_to warehouse_path(@warehouse)
    else
      flash[:error] = @location.errors.full_messages
      render 'new'
    end
  end

private

  def location_params
    params.require(:location)
      .permit(
        :name
      )
  end
end
