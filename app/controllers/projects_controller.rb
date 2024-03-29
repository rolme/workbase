class ProjectsController < ApplicationController

  def index
    @projects = projects.sorted
  end

  def new
    client   = params[:c].present? ? Client.find(params[:c]) : Client.new
    @project = Project.new(client_id: client.id, start_date: Date.today)
    @clients = clients
  end

  def create
    @project = Project.new(project_params.merge(company_id: current_user.company_id))
    @project.created_by_id = current_user.id
    if @project.save
      redirect_to @project
    else
      @clients = clients
      flash[:error] = @project.errors.full_messages
      render "new"
    end
  end

  def show
    @project    = project
    @proposal   = ProposalAdapter.new(project.proposal)
    @attachment = Attachment.new

    # get all units from current company
    @units      = current_company.units.without_project.order(:location_id)
  end

  # add project unit from existing list
  def add_unit
    project = projects.find_by(slug: params[:project_slug])
    unit    = Unit.find_by(slug: unit_params[:slug])
    if unit && unit.update(project_id: project.id)
      flash[:success] = 'Item added successfully!'
    else
      flash[:danger] = "Item not found"
    end
    redirect_to project
  end

private

  def clients
    Client.with_company_id(current_user.company_id)
  end

  def projects
    Project.with_company_id(current_user.company_id)
  end

  def project
    projects.find_by slug: params[:slug]
  end

  def project_params
    start_date = params[:project][:start_date]
    end_date   = params[:project][:end_date]

    if start_date.present?
      params[:project][:start_date] = Date.strptime(start_date, "%m/%d/%Y")
    end

    if end_date.present?
      params[:project][:end_date] = Date.strptime(end_date, "%m/%d/%Y")
    end

    params.require(:project).permit(
      :client_id,
      :end_date,
      :name,
      :project_status_id,
      :start_date,
      :title
    )
  end

  def unit_params
    params.require(:unit).permit(:slug)
  end
end
