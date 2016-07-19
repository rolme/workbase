class LoginController < ApplicationController
  layout 'info'
  skip_before_action :require_login

  # GET /login
  def index
  end
end
