class InventoryController < ApplicationController
  def index
    @units = Unit.group_units(current_user.company_id, {in_inventory: true}).sort_by{ |u| [u.manufacturer, u.model] }
  end

  def search
    @term = params[:q].downcase
    @units = Unit.group_units(current_user.company_id, {in_inventory: true, search: @term}).sort_by{ |u| [u.manufacturer, u.model] }
  end
end
