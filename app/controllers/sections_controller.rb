class SectionsController < ApplicationController

  # PATCH /projects/:project_id/proposals/:proposal_id/sections/:id
  def update
    @section = Section.find params[:id]

    if @section.update(section_params)
      redirect_to Project.find(params[:project_id])
    end
  end

private
  def section_params
    params.require(:section).permit(:data)
  end

end
