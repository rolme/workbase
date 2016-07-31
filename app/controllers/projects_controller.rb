class ProjectsController < ApplicationController
  def index
    @projects = Project.with_company_id(current_user.company_id).sorted
  end

  def show
    @project = Project.with_company_id(current_user.company_id).find params[:id]
  end
end
