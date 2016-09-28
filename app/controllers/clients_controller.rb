class ClientsController < ApplicationController
  
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

  # callback for contact import
  def callback
    @contacts = request.env['omnicontacts.contacts']
    if @contacts
      @contacts.each do |contact|
        client = Client.new(company_id: current_user.company_id,
                            city: contact[:city],
                            email: contact[:email],
                            first_name: contact[:first_name],
                            last_name: contact[:last_name],
                            phone: contact[:phone_number],
                            state: contact[:region],
                            street: contact[:address_1],
                            zipcode: contact[:postcode],
                            company_name: contact[:company])
        client.save(validate: false)
      end
      flash[:success] = 'Contacts import successfully!'
    else
      flash[:danger] = 'Contacts not found!'
    end
    redirect_to clients_path
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
        :zipcode,
        :client_type_id,
        :metadata => current_company.metadata&.collect(&:name) # company metadata field permit
      )
  end

end
