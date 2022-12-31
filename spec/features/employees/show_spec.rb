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

    @ticket_1 = Ticket.create!(subject: "Fix WiFi", age: 5)
    @ticket_2 = Ticket.create!(subject: "New Employee Hardware", age: 6)
    @ticket_3 = Ticket.create!(subject: "Software Update", age: 7)
    @ticket_4 = Ticket.create!(subject: "Fix AC", age: 8)

    @employee_1.tickets << @ticket_1
    @employee_1.tickets << @ticket_2
    @employee_1.tickets << @ticket_3
    # This is one way to associate a ticket with an employee
  end
  # US2
  it 'displays the employees name and department' do 
    visit "/employees/#{@employee_1.id}"

    expect(page).to have_content(@employee_1.name)
    expect(page).to have_content(@employee_1.department_name)
    # created a instance method of department_name in employee model. 
    # Need to write a model test for this instance method
    expect(page).to_not have_content(@employee_2.name)
    expect(page).to_not have_content(@marketing.name)
  end
  # US2
  it 'displays all of the employees tickets from oldest to youngest' do 
    visit "/employees/#{@employee_1.id}"

    expect(page).to have_content(@ticket_1.subject)
    expect(page).to have_content(@ticket_1.age)
    expect(page).to have_content(@ticket_2.subject)
    expect(page).to have_content(@ticket_2.age)
    expect(page).to have_content(@ticket_3.subject)
    expect(page).to have_content(@ticket_3.age)
    expect(page).to_not have_content(@ticket_4.subject)
    expect(page).to_not have_content(@ticket_4.age)

    expect(@ticket_3.subject).to appear_before(@ticket_2.subject)
    expect(@ticket_2.subject).to appear_before(@ticket_1.subject)
    expect(@ticket_1.subject).to_not appear_before(@ticket_3.subject)
  end
  # US2
  it 'displays a the oldest ticket assigned in a seperate list' do 
    visit "/employees/#{@employee_1.id}"

    expect(page).to have_content("Employee's Oldest Ticket: Subject: #{@ticket_3.subject} Age: #{@ticket_3.age}")
  end
  # US3
  it 'displays a form to assign a ticket to the employee' do 
    visit "/employees/#{@employee_1.id}"

    expect(page).to_not have_content(@ticket_4.subject)
    expect(page).to_not have_content(@ticket_4.age)
    expect(page).to have_content("Assign a ticket using ticket id")

    fill_in "Ticket", with: @ticket_4.id
    click_on "Assign Ticket"

    expect(current_path).to eq("/employees/#{@employee_1.id}")
    expect(page).to have_content(@ticket_4.subject)
    expect(page).to have_content(@ticket_4.age)
  end
end