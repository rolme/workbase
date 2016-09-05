class PasswordsController < ApplicationController
  layout 'info'
  skip_before_action :authenticate
  before_action :assert_reset_token_passed, only: [:edit]
  before_action :user_exist_for_token, only: [:update]

  # GET /password/new
  def new
  end

  # POST /passwords
  def create
    user = User.find_by_email(password_params[:email])
    if user
      user.send_reset_password_instructions
    else
      flash[:danger] = 'User not found for given email'
      render 'new'
    end
  end

  # GET /passwords/edit
  def edit
  end

  # PUT /passwords
  def update
    @user.set_new_password(reset_password_params) if @user
    if @user && @user.errors.empty?
      after_password_reset_path
    else
      render :edit
      flash[:danger] = @user.errors.full_messages
    end
  end

protected
  def after_password_reset_path
    redirect_to login_path
  end

  # Check if a reset_password_token is provided in the request
  def assert_reset_token_passed
    if params[:reset_password_token].blank?
      flash[:dander] = 'Missing token'
      redirect_to login_path
    end
  end

private
  def user_exist_for_token
    @user = User.find_by(reset_password_token: reset_password_params[:reset_password_token])
    unless @user
      flash[:dander] = 'Invalid url!'
      redirect_to login_path
    end 
  end

  def password_params
    params.require(:user).permit(:email)
  end

  def reset_password_params
    params.require(:user).permit(:new_password, :password_confirmation, :reset_password_token)
  end
end
