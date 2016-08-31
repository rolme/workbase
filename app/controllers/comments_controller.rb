class CommentsController < ApplicationController
  def create
    @ticket = Ticket.find_by(slug: params[:ticket_slug])
    @comment = @ticket.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      CommentsChannel.broadcast_to(@ticket.slug,
          comment: CommentsController.render(partial: 'tickets/comment', locals: { comment: @comment })
      )
      flash[:success] = 'Comment created'
      redirect_to @ticket
    else
      flash[:danger] = @comment.errors.full_messages
      render template: 'tickets/show'
    end
  end

private

  def comment_params
    params.require(:comment).permit(:title, :content, :public)
  end
end
