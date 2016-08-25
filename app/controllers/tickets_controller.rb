class TicketsController < ApplicationController
  def index
    @tickets = tickets.open.active.order(:status, :created_at)
  end

  def show
    @ticket = ticket
    @comment = Comment.new

    if @ticket.unviewed? || @ticket.viewed_by.nil?
      # Mark this ticket as viewed
      @ticket.unassigned!
      @ticket.viewed_by = current_user.id
      @ticket.save
    end
  end

  def new
    @ticket = Ticket.new
    @projects = projects
  end

  def create
    @ticket = Ticket.new(ticket_params.merge({
        company_id: current_user.company_id,
        viewed_by: current_user.id,
        created_by: current_user.id,
    }))
    if @ticket.save
      flash[:success] = 'Ticket created'
      redirect_to @ticket
    else
      flash[:danger] = @ticket.errors.full_messages
      render :edit
    end
  end

  def edit
    @ticket = ticket
    @projects = projects
  end

  def update
    @ticket = ticket
    if @ticket.update(ticket_params)
      flash[:success] = 'Ticket updated'
      redirect_to @ticket
    else
      flash[:danger] = @ticket.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    ticket.delete
    flash[:success] = 'Ticket deleted'
    redirect_to tickets_path
  end

  def toggle_close
    @ticket = ticket

    if !ticket.closed?
      @ticket.closed!
      TicketMailer.ticket_closed(@ticket).deliver
    elsif ticket.closed?
      @ticket.unassigned!
    end

    redirect_to @ticket
  end

private

  def tickets
    Ticket.where(company_id: current_user.company_id)
  end

  def ticket
    tickets.find_by(slug: params[:slug])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :assigned_to, :project_id)
  end

  def projects
    Project.where(company_id: current_user.company_id)
  end
end
