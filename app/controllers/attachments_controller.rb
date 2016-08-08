class AttachmentsController < ApplicationController
  before_filter :set_project

  # GET /projects/:project_slug/attachments
  def index
    @attachment = Attachment.new
  end

  # POST /projects/:project_slug/attachments
  def create
    @project.attachments.build(attachment_params)
    @project.save!

    redirect_to project_path(@project)
  end

  # PUT /projects/:project_slug/attachments/:slug
  def update
  end

  # DELETE /projects/:project_slug/attachments/:slug
  def destroy
    attachment = @project.attachments.find{ |a| a.slug == params[:slug] }
    attachment.destroy
    redirect_to project_path(@project)
  end

private

  def set_project
    @project = Project.includes(:attachments).find_by slug: params[:project_slug]
  end

  def attachment_params
    params.require(:attachment).permit(:asset, :description)
  end

end
