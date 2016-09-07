class LeadUserController < ActionController::Base
  layout 'info'
  def new
    @user = LeadUser.new
  end
  def create
    @user = LeadUser.new(user_params)
    
    if @user.save
      LeadUserMailer.confirmation_lead(@user).deliver
      flash[:success] = "Please confirm your email address to continue"
      redirect_to '/login'
    else
      flash[:error] = "Something went wrong!"
      render 'new'
    end
  end
  def confirm_email
    @user = LeadUser.find_by_confirm_token(params[:email])
    if @user
      @user.email_activate
      flash[:success] = "Welcome to the Workbase! Your email has been confirmed.
      Please sign in to continue."
      redirect_to signin_url
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end
  private
    def user_params
      params.require(:lead_user).permit(:email)
    end
end
