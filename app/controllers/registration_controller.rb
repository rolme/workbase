class RegistrationController < ActionController::Base
  layout 'info'

  # GET /registration
  def new
  end

  # POST /registration
  def create
    @registration_form = RegistrationForm.new
    if user = @registration_form.submit(registration_params)
      RegistrationMailer.confirmation(user).deliver
      redirect_to confirmation_registration_index_path
    else
      flash[:danger] = @registration_form.errors.full_messages
      render :new
    end
  end

  def confirm_email
    unless user.present?
      flash[:danger] = "Confirmation link is not valid."
      render :new
    end
  end

  def confirm_user_company
    if user.present?
      company = user.company
      company.update_attributes(name: company_params[:company_name])
      if company.errors.blank?
        user.update_attributes(confirmed: true, confirmation_token: nil)
        flash[:success] = 'You have sucessfully registered, login here'
        redirect_to login_path
      else
        flash[:danger] = company.errors.full_messages
        render :confirm_email
      end
    end
  end
  
private

  def user
    User.find_by(confirmation_token: params[:registration_id])
  end

  def company
    user.company
  end

  def registration_params
    params.require(:registration).permit(:email, :password, :password_confirmation)
  end

  def company_params
    params.require(:registration).permit(:company_name)
  end  
end
