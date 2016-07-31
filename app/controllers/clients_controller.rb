class ClientsController < ApplicationController
  def index
    @clients = clients.sorted
  end

  def new
    @client = Client.new(company_id: current_user.company_id)
  end

  def edit
    @client = clients.find params[:id]
  end

  def show
    @client = clients.find params[:id]
  end

private

  def clients
    Client.with_company_id(current_user.company_id)
  end

end
