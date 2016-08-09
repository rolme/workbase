class InventoryController < ApplicationController
  def index
    @warehouses = Warehouse.select(:name, :slug).where(company_id: current_user.company_id)
    @units = Unit.in_inventory.where(company_id: current_user.company_id).order(created_at: :desc).limit(10)
  end

  # We can view the inventory of Warehouses or Locations
  def show
    @area = Area.find_by(company_id: current_user.company_id, slug: params[:slug])
    @area_is_warehouse = @area.type == 'Warehouse'
    location_ids = @area_is_warehouse && @area.locations.any? ? @area.locations.pluck(:id).join(',') : @area.id
    @units = Unit.group_units(current_user.company_id, {in_inventory: true, location_ids: location_ids}).sort_by{ |u| [u.manufacturer, u.model] }
  end

  def search
    @term = params[:q].downcase
    @units = Unit.group_units(current_user.company_id, {in_inventory: true, search: @term}).sort_by{ |u| [u.manufacturer, u.model] }
  end
end
