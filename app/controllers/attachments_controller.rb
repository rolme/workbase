class AttachmentsController < ApplicationController
  before_filter :set_project

  # GET /projects/:project_id/attachments
  def index
    @attachment = Attachment.new
  end

  # POST /projects/:project_id/attachments
  def create
    @project.attachments.build(attachment_params)
    @project.save!

    redirect_to project_path(@project)
  end

  # PUT /projects/:project_id/attachments/:id
  def update
  end

  # DELETE /projects/:project_id/attachments/:id
  def destroy
    attachment = @project.attachments.find{ |a| a.slug == params[:id] }
    attachment.destroy
    redirect_to project_path(@project)
  end

private

  def set_project
    @project = Project.includes(:attachments).find_by slug: params[:project_id]
  end

  def attachment_params
    params.require(:attachment).permit(:asset, :description)
  end

end
