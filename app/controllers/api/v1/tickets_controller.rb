module Api::V1
  class TicketsController < ApiController
    def create
      # POST /api/v1/tickets
      # {
      #     "ticket": {
      #         "title": "This is an API test title",
      #         "description": "Lorem ipsum dolor. This is an API test description.",
      #         "submitted_by_name": "Test User",
      #         "submitted_by_email": "test.user@email.com",
      #         "submitted_by_company": "Test Company",
      #         "company_id": "2"
      #     },
      #     "client_slug": "ENeQVHfBNKMc9tTal4L7Mg"
      # }
      @ticket = @company.tickets.new
      @ticket.assign_attributes(@json['ticket'])

      if @ticket.save
        # notify company users
        TicketMailer.ticket_created(@ticket).deliver
        # notify external user
        TicketMailer.ticket_confirmation(@ticket).deliver

        render json: @ticket
      else
        head :internal_server_error
      end
    end
  end
end
