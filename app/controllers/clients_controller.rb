class ClientsController < ApplicationController
  layout "application_new"
  def index
    @clients = clients.sorted
  end

  def new
    @client = Client.new(company_id: current_user.company_id)
  end

  def create
    @client = Client.new(client_params.merge(company_id: current_user.company_id))
    if @client.save
      redirect_to @client
    else
      flash[:danger] = @client.errors.full_messages
      render "new"
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

end
