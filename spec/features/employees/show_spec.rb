require 'rails_helper'

RSpec.describe 'the employees show page' do 
  before :each do 
    @it = Department.create!(name: 'IT', floor: 'Basement')
    @accounting = Department.create!(name: 'Accounting', floor: 'First Floor')
    @marketing = Department.create!(name: 'Marketing', floor: 'Second Floor')

    @employee_1 = Employee.create!(name: 'Christina Aguilera', level: 2, department_id: @it.id)
    @employee_2 = Employee.create!(name: 'Brittney Spears', level: 2, department_id: @it.id)
    @employee_3 = Employee.create!(name: 'Justin Timberlake', level: 5, department_id: @accounting.id)
    @employee_4 = Employee.create!(name: 'Ryan Gosling', level: 5, department_id: @accounting.id)
    @employee_5 = Employee.create!(name: 'Keri Russell', level: 7, department_id: @marketing.id)
    @employee_6 = Employee.create!(name: 'JC Chasez', level: 7, department_id: @marketing.id)
  end

  it 'displays the employees name and department' do 
    visit "/employees/#{@it.id}"

  end

  xit 'displays all of the employees tickets from oldest to youngest' do 
    visit "/employees/#{@it.id}"
  end

  xit 'displays a the oldest ticket assigned in a seperate list' do 
    visit "/employees/#{@it.id}"
  end
end