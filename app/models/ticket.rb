class Ticket < ApplicationRecord
  has_many :employee_tickets
  has_many :employees, through: :employee_tickets

  def assigned_employees
    employees.pluck(:name)
  end
end