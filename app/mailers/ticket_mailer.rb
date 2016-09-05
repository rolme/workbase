class TicketMailer < ApplicationMailer
  # Notify company users that a new ticket has been created via the API
  def ticket_created(ticket)
    users = User.where(company_id: ticket.company_id, confirmed: true).collect(&:email).join(',')
    mail(to: users, subject: "Workbase: A new ticket has been submitted.")
  end

  # Send an email to the user who submitted this ticket to let them know it has
  # been created and provide a link to it.
  def ticket_confirmation(ticket)
    send_to = ticket.submitted_by_email.presence
    mail(to: send_to, subject: "Workbase: Your ticket has been created.") if send_to
  end

  # Send an email to the user who submitted this ticket to let them know it has
  # been closed.
  def ticket_closed(ticket)
    send_to = ticket.submitted_by_email.presence
    mail(to: send_to, subject: "Workbase: Your ticket has been closed.") if send_to
  end

  # Send an email to the user who submitted this ticket to let them know a public
  # comment has been added.
  def public_comment_added(ticket)
    send_to = ticket.submitted_by_email.presence
    mail(to: send_to, subject: "Workbase: A new comment has been added.") if send_to
  end
end
