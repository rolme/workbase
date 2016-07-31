class UnitsController < ApplicationController
  def list
    @units = Unit.with_company_id(current_user.company_id).where(unit_hash: params[:id]).in_inventory
  end
end
