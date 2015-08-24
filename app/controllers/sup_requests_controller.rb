class SupRequestsController < ApplicationController

  before_action :find_ticket, only: [:show, :edit, :update, :destroy, :update_status]

  def new
    @ticket = SupRequest.new
  end

  def create
    @ticket = SupRequest.new(ticket_params)
    if @ticket.save
      redirect_to sup_requests_path(@ticket), notice: "Ticket Submited!"
    else
      flash[:alert] = "See errors Below"
      render :new
    end
  end

  def show

  end

  def index
    if params[:search]
      @ticket = SupRequest.search(params[:search]).order("is_done DESC").page(params[:page]).per(5)
    else
      @ticket = SupRequest.order(:is_done).page(params[:page]).per(5)
    end
  end


  def edit

  end

  def update
    if @ticket.update ticket_params
      redirect_to sup_request_path(@ticket), notice: "Ticket Updated!"
    else
      flash[:alert] = "See errors Below"
      render :edit
    end
  end

  def update_status
      @ticket.is_done = 1
      @ticket.save
      redirect_to sup_requests_path, notice: "Ticket marked as Completed!"
  end

  def destroy
    @ticket.destroy
    redirect_to sup_requests_path, notice: "Ticket Deleted!"
  end

  private

  def find_ticket
    @ticket = SupRequest.find params[:id]
  end

  def ticket_params

    ticket_params = params.require(:sup_request).permit([:name, :email, :department, :message, :is_done])
  end



end
