class LocationsController < ApplicationController
  
  def new
    @warehouse = warehouse
    @location = Location.new
  end

  def edit
    @warehouse = warehouse
    @location = Location.find(params[:slug])
  end

  def create
    @warehouse = warehouse
    @location = Location.new(location_params.merge(company_id: current_user.company_id, created_by_id: current_user.id, parent_id: @warehouse.id))

    if @location.save
      redirect_to @warehouse
    else
      flash[:danger] = @location.errors.full_messages
      render 'new'
    end
  end

  def update
    @warehouse = warehouse
    @location = Location.find(params[:slug])

    if @location.update(location_params)
      redirect_to @warehouse
    else
      flash[:danger] = @location.errors.full_messages
      render 'edit'
    end
  end

private

  def warehouse
    Warehouse.where(company_id: current_user.company_id, slug: params[:warehouse_slug]).first
  end

  def location_params
    params.require(:location)
      .permit(
        :name
      )
  end
end
