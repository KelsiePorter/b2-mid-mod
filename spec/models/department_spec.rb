require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'relationships' do
    it { should have_many :employees }
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
    end
    describe '#employee_names' do
      it 'displays the employees name for each department' do 

        expect(@it.employee_names).to eq(['Christina Aguilera', 'Brittney Spears'])
        expect(@accounting.employee_names).to eq(['Justin Timberlake', 'Ryan Gosling'])
        expect(@marketing.employee_names).to eq(['Keri Russell', 'JC Chasez'])
      end
    end
  end
end