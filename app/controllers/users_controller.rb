class UsersController < ApplicationController

  # GET /users
  def index
    @users = users
  end

  def profile
    @user = user
  end

  def update
    @user = user
    params = @user.type.present? ? user_params(@user.type) : basic_params
    if @user.update(params)
      render :profile
    else
      flash[:danger] = @user.errors.full_messages
      render :profile
    end
  end

  # DELETE /users/:slug
  def destroy
    if user.deleted?
      user.destroy
    else
      user.delete
    end
    @users = users
    render :index
  end

  # POST /users/:slug/password_update
  def password_update
    @user = user
    if @user.update(password_params(@user.type))
      render :profile
    else
      flash[:danger] = @user.errors.full_messages
      render :profile
    end
  end

private

  def users
    User.where(company_id: current_user.company_id)
  end

  def user
    users.find_by slug: params[:slug]
  end

  def user_params(type)
    params.require(type.downcase.to_sym).permit(:security_question_id, :security_answer, :email, :phone, :avatar)
  end

  def password_params(type)
    params.require(type.downcase.to_sym).permit(:new_password, :current_password)
  end

  def basic_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
