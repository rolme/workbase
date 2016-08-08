class SectionsController < ApplicationController

  # PATCH /projects/:project_slug/proposals/:proposal_slug/sections/:id
  def update
    @section = Project.find(params[:project_slug]).proposal.sections.find params[:id]

    if @section.update(section_params)
      redirect_to Project.find(params[:project_slug])
    end
  end

private
  def section_params
    params.require(:section).permit(:data)
  end

end
