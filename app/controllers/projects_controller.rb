class ProjectsController < ApplicationController
  def index
    @projects = projects.sorted
  end

  def show
    @project    = projects.find params[:id]
    @attachment = Attachment.new
  end

private

  def projects
    Project.with_company_id(current_user.company_id)
  end
end
