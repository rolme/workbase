class BaseApiController < ActionController::Base
  before_action :parse_request, :authenticate_project_from_slug

private

  def authenticate_project_from_slug
    if !params[:project_slug]
      head :unauthorized
      return
    else
      @project = Project.find_by(slug: params[:project_slug], company_id: @json['ticket']['company_id'])
    end

    unless @project.present?
      head :unprocessable_entity
    end
  end

  def parse_request
    @json = JSON.parse(request.body.read)
  end
end
