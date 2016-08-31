class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comments:#{params[:ticket_slug]}"
  end
end
