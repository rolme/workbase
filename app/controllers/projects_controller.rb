class ProjectsController < ApplicationController
  def index
    @projects = projects.sorted
  end

  def new
    client   = params[:c].present? ? Client.find(params[:c]) : Client.new
    @project = Project.new(client_id: client.id)
    @clients = Client.with_company_id(current_user.company_id)
  end

  def show
    @project    = project
    @attachment = Attachment.new
  end

private

  def projects
    Project.with_company_id(current_user.company_id)
  end

  def project
    projects.find_by slug: params[:slug]
  end
end
