class UnitsController < ApplicationController

  # GET /units/:unit_hash/list
  def list
    @units = units.where(unit_hash: params[:id]).in_inventory
  end

  # GET /units/:id
  def show
    @unit = unit
  end

  # GET /units/new
  def new
    @unit       = Unit.new
    @unit_categories = unit_categories
    @locations  = locations
  end

  # POST /units
  def create
    @unit = Unit.new(unit_params.merge(company_id: current_user.company_id))
    @unit.location_required = true
    if @unit.save
      redirect_to @unit
    else
      @unit_categories = unit_categories
      @locations  = locations
      flash[:error] = @unit.errors.full_messages
      render 'new'
    end
  end

  # GET /units/:id
  def edit
    @unit            = unit
    @unit_categories = unit_categories
    @locations       = locations
  end

  # PATCH /units/:id
  def update
    @unit = unit
    @unit.location_required = true
    if @unit.update(unit_params)
      redirect_to @unit
    else
      @unit_categories = unit_categories
      @locations  = locations
      flash[:error] = @unit.errors.full_messages
      render 'edit'
    end
  end

private

  def units
    Unit.with_company_id(current_user.company_id)
  end

  def unit
    units.find_by slug: params[:id]
  end

  def unit_categories
    UnitCategory.with_company_id(current_user.company_id).ordered
  end

  def locations
    Location.with_company_id(current_user.company_id).order(:cached_warehouse_name, :name)
  end

  def unit_params
    params.require(:unit)
      .permit(
        :client_description,
        :cost,
        :description,
        :location_id,
        :manufacturer,
        :model,
        :unit_category_id
      )
  end
end
