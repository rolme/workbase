class ClientTypesController < ApplicationController
  before_action :client_type, only: [:edit, :update, :destroy, :restore]
  before_action :client_types, only: [:index, :destroy, :restore]

  # GET /client_types
  def index
  end

  # GET /client_types/new
  def new
    @client_type = ClientType.new
  end

  # POST /client_types
  def create
    @client_type = client_types.new(client_type_params)
    if @client_type.save
      client_types
      render :index
    else
      flash[:danger] = @client_type.errors.full_messages
      render 'new'
    end
  end

  # GET /client_types/:slug/edit
  def edit
  end

  # PATCH /client_types/:slug
  def update
    if @client_type.update(client_type_params)
      client_types
      render :index
    else
      flash[:danger] = @client_type.errors.full_messages
      render 'edit'
    end
  end

  # DELETE /client_types/:slug
  def destroy
    if @client_type.deleted?
      @client_type.destroy
    else
      @client_type.delete
    end
    render :index
  end

  # GET /client_types/:slug/restore
  def restore
    if client_type.deleted?
      client_type.restore
    end
    render :index
  end

  private

  def client_type_params
    params.require(:client_type).permit(:label)
  end

  def client_type
    @client_type = current_company.client_types.find_by(slug: params[:slug])
  end

  def client_types 
    @client_types = current_company.client_types 
  end
end