class UploadsController < ApplicationController

  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      render json: { message: "success", fileID: @upload.id }, :status => 200
    else
      render json: { error: @upload.errors.full_messages.join(',')}, :status => 400
    end
  end

  def destroy
    @upload = Upload.find_by_id(params[:id])
    if @upload.destroy
      render json: { message: "success", fileID: @upload.id }, :status => 200
    else
      render json: { error: @upload.errors.full_messages.join(',')}, :status => 400
    end
  end

  def show
    @upload = Upload.find_by_id(params[:id])
    if @upload
      render json: { message: "success", fileID: @upload.id, fileName: @upload.image_name, fileUrl: @upload.image.url }, :status => 200
    else
      render json: { error: @upload.errors.full_messages.join(',')}, :status => 400
    end
  end

  private
    def upload_params
      params.require(:upload).permit(:image)
    end
end
