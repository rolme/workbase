class InventoryController < ApplicationController
  def index
    @units = Unit.with_company_id(current_user.company_id).in_inventory.grouped.sorted
  end
end
