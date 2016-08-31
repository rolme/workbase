class WarehousesController < ApplicationController
  def index
    @warehouses = company_warehouses.all
  end

  def show
    @warehouse = warehouse
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
      flash[:danger] = @warehouse.errors.full_messages
      render 'new'
    end
  end

  def edit
    @warehouse = warehouse
  end

  def update
    @warehouse = warehouse
    if @warehouse.update(warehouse_params)
      redirect_to @warehouse
    else
      flash[:danger] = @warehouse.errors.full_messages
      render 'edit'
    end
  end

private

  def company_warehouses
    Warehouse.where(company_id: current_user.company_id)
  end

  def warehouse
    company_warehouses.where(slug: params[:slug]).first
  end

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
