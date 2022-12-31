class Employee < ApplicationRecord
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  def department_name
    department.name
    # For US2
    # just department returns the whole department object. Calling
    #.name on department returns the name attribute of the department object.
    # Need to write a model level test for this method. 
  end
end