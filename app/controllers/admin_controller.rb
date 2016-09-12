class AdminController < ApplicationController
  before_filter :authorized?

private

  def authorized?
    unless current_user.admin?
      flash[:error] = "You are not authorized to view that page."
      redirect_to workbase_index_path
    end
  end
end
