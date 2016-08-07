class WarehousesController < ApplicationController
  def index
    @warehouses = Warehouse.all
  end

  def show
    @warehouse = Warehouse.find params[:id]
    @locations = Location.where(parent_id: @warehouse.id)
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params.merge(company_id: current_user.company_id, created_by_id: current_user.id))
    if @warehouse.save
      redirect_to @warehouse
    else
      flash[:error] = @warehouse.errors.full_messages
      render 'new'
    end
  end

  def edit
    @warehouse = Warehouse.find params[:id]
  end

  def update
    @warehouse = Warehouse.find params[:id]
    if @warehouse.update(warehouse_params)
      redirect_to @warehouse
    else
      flash[:error] = @warehouse.errors.full_messages
      render 'edit'
    end
  end

private

  def warehouse_params
    params.require(:warehouse)
      .permit(
        :name,
        :street,
        :city,
        :state,
        :zipcode
      )
  end
end
