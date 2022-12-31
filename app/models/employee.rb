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

  def assigned_tickets
    tickets.order(age: :desc)
    # For US2
    # We are getting all of the tickets associated with the instance of 
    # employee and ordering them by age from oldest to youngest (descending) 
    # Need to write a model test for this
  end

  def oldest_ticket
    assigned_tickets.first 
    # this takes the assigned_tickets method above and returns the first ticket
    # becasue the above method already has them sorted from oldest to youngest.
    # The last part of US2 just needs the oldest ticket. If we needed the 
    # youngest, we could do assigned_tickets.last
  end
end