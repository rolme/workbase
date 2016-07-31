class ClientsController < ApplicationController
  def index
    @clients = Client.with_company_id(current_user.company_id).sorted
  end
end
