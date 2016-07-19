class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :require_login

  helper_method :current_user

  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by_and_cast(id: session[:current_user_id])
  end

  def login_user
    @_login_user ||= session[:login_user_id] && SuperAdmin.find_by(id: session[:login_user_id])
  end

private

  def require_login
    unless current_user
      redirect_to login_index_path
    end
  end

end
