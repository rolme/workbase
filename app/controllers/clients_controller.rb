class ClientsController < ApplicationController
  
  def index
    @clients = clients.sorted
  end

  def new
    @clients = Client.new(company_id: current_user.company_id)
  end

  def create
    @client = Client.new(client_params.merge(company_id: current_user.company_id))
    if params[:client_lead_submit]
      if @client.save
        ClientsMailer.confirmation(@client).deliver
        flash[:success] = "A confirmation is sent to your Email."
        redirect_to '/login'
      else
        flash[:danger] = @client.errors.full_messages
        redirect_to root_url
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

  def edit
    @client = client
  end

  def update
    @client = client
    if @client.update(client_params)
      redirect_to @client
    else
      flash[:danger] = @client.errors.full_messages
      render "edit"
    end
  end

  def show
    @client = client
  end

private

  def clients
    Client.with_company_id(current_user.company_id)
  end

  def client
    clients.find_by slug: params[:slug]
  end

  def client_params
    params.require(:client)
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
  def client_lead_params
    params.require(:client).permit(:email)
  end

end
