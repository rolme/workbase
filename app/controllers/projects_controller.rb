class ProjectsController < ApplicationController
  def index
    @projects = projects.sorted
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
    projects.find_by slug: params[:id]
  end
end
