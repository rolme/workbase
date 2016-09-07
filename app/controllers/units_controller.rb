class UnitsController < ApplicationController
  before_action :initialize_unit, only: [:new, :new_project_unit]

  # GET /units/list
  def list
    @units = units.where(unit_hash: params[:h]).in_inventory
  end

  # GET /units/:slug
  def show
    @unit = unit
  end

  # GET /units/new
  def new
  end

  # POST /units
  def create
    @unit = Unit.new(unit_params.merge(company_id: current_user.company_id))
    @unit.location_required = true
    if @unit.save
      redirect_to @unit
    else
      @unit_categories = unit_categories
      @locations  = locations
      flash[:danger] = @unit.errors.full_messages
      render 'new'
    end
  end

  # GET /units/:slug
  def edit
    @unit            = unit
    @unit.build_upload if @unit.upload.blank?
    @unit_categories = unit_categories
    @locations       = locations
  end

  # PATCH /units/:slug
  def update
    @unit = unit
    @unit.location_required = true
    if @unit.update(unit_params)
      redirect_to @unit
    else
      @unit_categories = unit_categories
      @locations  = locations
      flash[:danger] = @unit.errors.full_messages
      render 'edit'
    end
  end

  # POST /create_with_project 
  # create unit with project
  def create_project_unit
    @unit = Unit.new(unit_params.merge(company_id: current_company.id))
    @unit.project_required = true
    @unit.project_id = project.id if project
    if @unit.save
      flash[:success] = 'Item added successfully!'
      redirect_to project
    else
      @unit_categories = unit_categories
      @locations  = locations
      flash[:danger] = @unit.errors.full_messages
      render 'new_project_unit'
    end
  end

  # GET /unit_project
  # new unit with project 
  def new_project_unit
  end

  # unassign unit for project
  def remove_unit
    @unit = units.find_by(slug: params[:unit_slug])
    if @unit.update(project_id: nil)
      flash[:success] = 'Item removed successfully!'
    else
      flash[:danger] = @unit.errors.full_messages
    end
    redirect_to :back
  end

private

  # initialize new unit 
  def initialize_unit
    @unit       = Unit.new
    @unit.build_upload
    @unit_categories = unit_categories
    @locations  = locations
  end

  # get project 
  def project
    Project.find_by slug: params[:project_slug]
  end

  def units
    Unit.with_company_id(current_user.company_id)
  end

  def unit
    units.find_by slug: params[:slug]
  end

  def unit_categories
    UnitCategory.with_company_id(current_user.company_id).ordered
  end

  def locations
    Location.with_company_id(current_user.company_id).order(:cached_warehouse_name, :name)
  end

  def unit_params
    params.require(:unit)
      .permit(
        :client_description,
        :cost,
        :description,
        :location_id,
        :manufacturer,
        :model,
        :unit_category_id,
        :upload_id,
        :upload_attributes => [:id, :image, :_destroy]
      )
  end

end
