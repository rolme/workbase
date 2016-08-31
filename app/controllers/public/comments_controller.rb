class Public::CommentsController < ApplicationController
  skip_before_action :authenticate

  def create
    @ticket = Ticket.find_by(slug: params[:ticket_slug])
    @comment = @ticket.comments.new(comment_params)
    # TODO: Fix this, maybe a 'Generic System User'
    @comment.user = WorkbaseEmployee.first
    # TODO: Add a 'name' field for external submissions

    if @comment.save
      flash[:success] = 'Comment created'
      redirect_to customer_external_tickets_path(access_key: @ticket.access_key)
    else
      flash[:danger] = @comment.errors.full_messages
      render template: 'tickets/customer'
    end
  end

private

  def comment_params
    params.require(:comment).permit(:title, :content, :public)
  end
end
