class RegistrationController < ActionController::Base
  layout 'info'

  # GET /registration
  def new
  end

  # POST /registration
  def create
    @registration_form = RegistrationForm.new
    if @registration_form.submit(registration_params)
      redirect_to confirmation_registration_index_path
    else
      flash[:notice] = @registration_form.errors.full_messages.join(', ')
      render :new
    end
  end

private

  def registration_params
    params.require(:registration).permit(:company_name, :email, :password)
  end
end
