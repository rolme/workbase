class LoginController < ApplicationController
  layout 'info'
  skip_before_action :authenticate

  # GET /login
  def index
  end

end
