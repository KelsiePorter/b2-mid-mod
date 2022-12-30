require 'rails_helper'

RSpec.describe 'the departments index' do 
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

  it 'lists all of the departments with their name, floor, and associated employees' do 
    visit '/departments'
    # save_and_open_page
    
    within "#department-#{@it.id}" do
      expect(page).to have_content(@it.name)
      expect(page).to have_content(@it.floor)
      expect(page).to have_content(@employee_1.name)
      expect(page).to have_content(@employee_2.name)
    end

    within "#department-#{@accounting.id}" do
      expect(page).to have_content(@accounting.name)
      expect(page).to have_content(@accounting.floor)
      expect(page).to have_content(@employee_3.name)
      expect(page).to have_content(@employee_4.name)
    end

    within "#department-#{@marketing.id}" do
      expect(page).to have_content(@marketing.name)
      expect(page).to have_content(@marketing.floor)
      expect(page).to have_content(@employee_5.name)
      expect(page).to have_content(@employee_6.name)
    end
  end
end