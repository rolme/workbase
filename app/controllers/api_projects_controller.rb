class ApiProjectsController < BaseApiController
  def create
    # POST /api/v1/projects/*project_slug*/tickets
    # {
    #     "ticket": {
    #         "title": "This is an API test title",
    #         "description": "Lorem ipsum dolor. This is an API test description.",
    #         "submitted_by_name": "Test User",
    #         "submitted_by_email": "test.user@email.com",
    #         "submitted_by_company": "Test Company",
    #         "company_id": "2"
    #     }
    # }
    @ticket = @project.tickets.new
    @ticket.assign_attributes(@json['ticket'])

    if @ticket.save
      render json: @ticket
    else
      head :internal_server_error
    end
  end
end
