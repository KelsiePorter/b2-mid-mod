class CreateEmployeeTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_tickets do |t|
      t.belongs_to :employee, foreign_key: true
      t.belongs_to :ticket, foreign_key: true

      t.timestamps
    end
  end
end
