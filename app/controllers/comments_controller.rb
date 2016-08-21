class CommentsController < ApplicationController
  def create
    @ticket = Ticket.find_by(slug: params[:ticket_slug])
    @comment = @ticket.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:success] = 'Comment created'
      redirect_to @ticket
    else
      flash[:error] = @comment.errors.full_messages
      render ticket_show_path(@ticket)
    end
  end

private

  def comment_params
    params.require(:comment).permit(:title, :content, :public)
  end
end
