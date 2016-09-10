class Public::ClientsController < ApplicationController
  skip_before_action :authenticate

  def index
    @clients = clients.sorted
  end

  def new
    @client = Client.new(Company.find_by(name: 'eWorkbase'))
  end

  def create
    @client = Client.new(client_params)
    if params[:client_lead_submit]
      if @client.save
        ClientsMailer.confirmation(@client).deliver
        flash[:success] = "A confirmation is sent to your Email."
        redirect_to '/login'
      else
        flash[:danger] = @client.errors.full_messages
        redirect_to '/register'
      end
    else
      if @client.save
        redirect_to @client
      else
        flash[:danger] = @client.errors.full_messages
        redirect_to root_url
      end
    end
  end
  def confirm_email
    @user = Client.find_by(confirmation_token: params[:clients_id])
    if @user.present?
      @user.update_attributes(confirmed: true, confirmation_token: nil)
      redirect_to root_path
    else
      flash[:danger] = "Confirmation link is not valid."
      render :new
    end
  end

private
  def client_params
    params.require(:clients)
      .permit(
        :city,
        :company_name,
        :email,
        :fax,
        :first_name,
        :last_name,
        :phone,
        :state,
        :street,
        :zipcode
      )
  end
end
