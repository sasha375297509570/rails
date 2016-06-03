class CreateEmployeesDays < ActiveRecord::Migration
  def change
    create_table :employees_days, id: false do |t|
 
	  t.references :employee, index: true, foreign_key: true
	  t.references :day, index: true, foreign_key: true
	  

    end
	execute "ALTER TABLE employees_days ADD COLUMN type ENUM('1', '2') NOT NULL;"
	execute "ALTER TABLE employees_days ADD PRIMARY KEY (employee_id, day_id);"
  end
end
