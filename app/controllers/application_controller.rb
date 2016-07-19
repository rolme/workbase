class ApplicationController < ActionController::Base
  include Pundit
  include GateKeeper
  protect_from_forgery with: :exception

  # Public: Display an authentication error to the user
  def auth_error(message)
    @error_message = message
    render 'errors/401', :layout => 'error', :status => 401
  end

end
