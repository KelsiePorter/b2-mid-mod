require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'relationships' do
    it { should belong_to :department }
    it { should have_many :employee_tickets }
    it { should have_many(:tickets).through(:employee_tickets) }
  end

  describe 'instance methods' do 
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
      @employee_6.tickets << @ticket_1
      @employee_6.tickets << @ticket_2
      @employee_6.tickets << @ticket_4
    end
    # US2
    describe '#department_name' do 
      it 'returns the department name for the employee' do 

        expect(@employee_1.department_name).to eq('IT')
        expect(@employee_2.department_name).to eq('IT')
        expect(@employee_3.department_name).to eq('Accounting')
        expect(@employee_5.department_name).to eq('Marketing')
        expect(@employee_5.department_name).to_not eq('Accounting')
      end
    end
    # US2
    describe '#assigned_tickets' do 
      it 'displays the employees assigned tickets from oldest to youngest' do 

        expect(@employee_1.assigned_tickets).to eq([@ticket_3, @ticket_2, @ticket_1])
      end
    end
  end
end