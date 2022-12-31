class EmployeeTicketsController < ApplicationController 

  def create
    EmployeeTicket.create(permitted_params)

    redirect_to "/employees/#{permitted_params[:employee_id]}"
  end

  private 

  def permitted_params
    params.permit(:ticket_id, :employee_id)
  end
end