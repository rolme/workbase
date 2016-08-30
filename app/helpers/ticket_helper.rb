module TicketHelper
  def humanize_event(event_string)
    case(event_string)
    when 'create'
      'created ticket'
    when 'update'
      'made changes'
    else
      'unknown event'
    end
  end
end
