class InventoryController < ApplicationController
  # GET /inventory
  layout "application_new"
  def index
    @warehouses = Warehouse.select(:name, :slug).where(company_id: current_user.company_id)
    @units = Unit.in_inventory.where(company_id: current_user.company_id).order(created_at: :desc).limit(10)
  end

  # GET /inventory/:area_slug
  # We can view the inventory of Warehouses or Locations
  def show
    @area = area
    location_ids = @area.warehouse? && @area.locations.any? ? @area.locations.pluck(:id).join(',') : @area.id
    @units = Unit.group_units(current_user.company_id, {in_inventory: true, location_ids: location_ids}).sort_by{ |u| [u.manufacturer, u.model] }
  end

  # GET /inventory?q=QUERY
  def search
    @term = params[:q].downcase
    @units = Unit.group_units(current_user.company_id, {in_inventory: true, search: @term}).sort_by{ |u| [u.manufacturer, u.model] }
  end

  # GET /inventory/:area_slug/checkin
  def checkin
    @area = area
    @locations   = @area.warehouse? ? @area.locations : @area
    location_ids = @area.warehouse? ? @area.locations.map(&:id) : @area.id
    @units = Unit.in_inventory.where(company_id: current_user.company_id, location_id: location_ids)
  end

private

  def area
    Area.find_by(company_id: current_user.company_id, slug: params[:area_slug])
  end
end
