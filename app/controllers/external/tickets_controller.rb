# Intended for unauthenticated actions by our external users

class External::TicketsController < ApplicationController
  skip_before_action :authenticate

  def customer
    not_found unless params[:access_key].present?
    @ticket = Ticket.find_by(access_key: params[:access_key])
    not_found unless @ticket.present?
    @comment = Comment.new

    render 'tickets/customer'
  end

  def toggle_close
    @ticket = ticket

    if !ticket.closed?
      @ticket.closed!
      TicketMailer.ticket_closed(@ticket).deliver
    elsif ticket.closed?
      @ticket.unassigned!
    end

    redirect_to customer_external_tickets_path(access_key: @ticket.access_key)
  end

private

  def ticket
    Ticket.find_by(slug: params[:slug])
  end
end
