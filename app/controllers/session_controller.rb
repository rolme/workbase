class SessionController < ApplicationController

  skip_before_action :authenticate, :authorize

  # POST /login
  def create
    user = User.find_by(email: login_params["email"])
    if user && user.authenticate(login_params[:password])
      session[:current_user_id] = session[:login_user_id] = user.id
      redirect_to workbase_index_path
    else
      redirect_to login_index_path, flash: { danger: "Invalid email or password." }
    end
  end

  # POST /logout
  def destroy
    if session[:current_user_id] == session[:login_user_id]
      name = User.select(:last_name, :first_name).find(session[:login_user_id]).full_name
      reset_session
      redirect_to login_index_path, flash: { danger: "You have logged out." }
    else
      name = current_user.try(:full_name)
      session[:current_user_id]    = session[:login_user_id]
      redirect_to workbase_index_path
    end
  end

  # POST /emulate
  def emulate
    if login_user.employee? && params[:email].present?
      user                      = User.find_by(email: params[:email])
      session[:current_user_id] = user.id

      # TODO: Once we have memcached we will not need to wait for session store
      #       to complete. Until then, give it half second.
      sleep(1)
    end
    redirect_to workbase_index_path
  end

private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
