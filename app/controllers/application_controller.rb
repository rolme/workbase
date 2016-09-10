class ApplicationController < ActionController::Base
  include Pundit
  include GateKeeper
  protect_from_forgery with: :exception

  before_action :set_paper_trail_whodunnit

  # Public: Display an authentication error to the user
  def auth_error(message)
    @error_message = message
    render 'errors/401', :layout => 'error', :status => 401
  end

  def not_found
    render 'errors/404' and return
  end

  def current_company
    current_user.try(:company)
  end
end
