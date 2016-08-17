class TicketsController < ApplicationController
  def index
    @tickets = tickets.open.active.order(:status, :created_at)
  end

  def show
    @ticket = ticket

    if @ticket.unviewed? || @ticket.viewed_by.nil?
      # Mark this ticket as viewed
      @ticket.unassigned!
      @ticket.viewed_by = current_user.id
      @ticket.save
    end
  end

  def new
    @ticket = Ticket.new
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
      flash[:error] = @ticket.errors.full_messages
      render :edit
    end
  end

  def edit
    @ticket = ticket
  end

  def update
    @ticket = ticket
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      flash[:error] = @ticket.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    ticket.delete
    flash[:success] = 'Ticket deleted'
    redirect_to tickets_path
  end

private

  def tickets
    Ticket.where(company_id: current_user.company_id)
  end

  def ticket
    tickets.find_by(slug: params[:slug])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :assigned_to)
  end
end
