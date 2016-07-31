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
      flash[:error] = @registration_form.errors.full_messages
      render :new
    end
  end

  def confirm_email
    @user = User.find_by(confirmation_token: params[:registration_id])
    if @user.present?
      @user.update_attributes(confirmed: true, confirmation_token: nil)
      redirect_to root_path
    else
      flash[:error] = "Confirmation link is not valid."
      render :new
    end
  end

private

  def registration_params
    params.require(:registration).permit(:company_name, :email, :password)
  end
end
