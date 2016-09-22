class EncountersController < ApplicationController
  before_action :get_client, only: [:create, :update]
  before_action :encounter, only: [:show, :edit, :update, :destroy]

  def index
    @encounters = encounters
  end

  def new
    @encounter = Encounter.new
    @clients = clients
  end

  def create
    @encounter = encounters.new(encounter_params)
    if @encounter.save
      redirect_to @encounter
    else
      flash[:danger] = @encounter.errors.full_messages
      @clients = clients
      render :new
    end
  end

  def show
  end

  def edit
    @clients = current_user.company.clients
  end

  def update
    if @encounter.update(encounter_params)
      redirect_to @encounter
    else
      flash[:danger] = @encounter.errors.full_messages
      @clients = clients
      render :edit
    end
  end

  def destroy
  end

  private

  def encounter_params
    params.require(:encounter).permit(:client_id, :encounter_type_id, :notes, :encounter_date, :duration)
  end

  def encounters
    current_user.encounters
  end

  def encounter
    @encounter = encounters.find_by(slug: params[:slug])
  end

  def clients
    current_user.company.clients
  end

  def get_client
    client = clients.find_by(slug: encounter_params[:client_id])
    params[:encounter][:client_id] = client&.id
  end
end
