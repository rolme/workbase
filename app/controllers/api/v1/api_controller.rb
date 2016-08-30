module Api::V1
  class ApiController < ActionController::Base
    before_action :parse_request, :authenticate_client_from_slug

  private

    def authenticate_client_from_slug
      if !params[:client_slug]
        head :unauthorized
        return
      else
        @company = Client.find_by(slug: params[:client_slug], company_id: @json['ticket']['company_id']).company
      end

      unless @company.present?
        head :unprocessable_entity
      end
    end

    def parse_request
      @json = JSON.parse(request.body.read)
    end
  end
end
