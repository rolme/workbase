module GateKeeper

  extend ActiveSupport::Concern

  included do
    before_action :authenticate,
                  :authorize

    helper_method :current_account,
                  :current_user,
                  :login_user
  end

  def authenticate
    if !login_user
      redirect_to login_index_path
    end
  end

  def authorize
    true
  end

  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  def login_user
    @_login_user ||= session[:login_user_id] && User.find_by(id: session[:login_user_id])
  end

end
