class InventoryController < ApplicationController
  def index
    @warehouses = Warehouse.select(:name, :id).where(company_id: current_user.company_id)
  end

  def show
    @area = Area.find params[:id]
    @area_is_warehouse = @area.type == 'Warehouse'
    location_ids = @area_is_warehouse && @area.locations.any? ? @area.locations.pluck(:id).join(',') : @area.id
    @units = Unit.group_units(current_user.company_id, {in_inventory: true, location_ids: location_ids}).sort_by{ |u| [u.manufacturer, u.model] }
  end
end
