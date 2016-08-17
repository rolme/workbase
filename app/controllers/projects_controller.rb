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
    @attachment = Attachment.new
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
    params.require(:project).permit(
      :client_id,
      :end_date,
      :name,
      :project_status_id,
      :start_date,
      :title
    )
  end
end
