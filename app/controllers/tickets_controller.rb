class TicketsController < ApplicationController

  before_action :ticket_set, only: [:show, :destroy]

  def index
    @tickets = Ticket.all.page params[:page]
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.create
      redirect_to @ticket, notice: 'Ticket was successfully created'
    else
      render :new, notice: 'Ticket was not created'
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Ticket was successfully removed'
  end

  private
    def ticket_set
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:id, :ticket_type, :description, :accomplish_time, :author, :executor, :status)
    end
end
