class Api::ApplicationController < ActionController::Base
  before_action :authenticate

protected

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      App.find_by(token: token, url: request.host)
    end
  end

  # TODO: Not sure if having a session makes sense here.
  def current_user
    @_current_user ||= session[:current_user_id] && User.includes(:company).find_by(id: session[:current_user_id])
  end

  def login_user
    @_login_user ||= session[:login_user_id] && User.find_by(id: session[:login_user_id])
  end

end
