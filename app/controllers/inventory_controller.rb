class InventoryController < ApplicationController
  def index
    @units = Unit.group_units(current_user.company_id, {in_inventory: true}).sort_by{ |u| [u.manufacturer, u.model] }
  end
end
