class AddOndeleteCaskadeEmployeesDays < ActiveRecord::Migration
  def change
    
	execute "ALTER TABLE employees_days DROP FOREIGN KEY fk_rails_c963fd4cb7;"
	execute "ALTER TABLE employees_days DROP FOREIGN KEY fk_rails_cc2399c96d;"
	execute "ALTER TABLE employees_days ADD CONSTRAINT fk_employees_days_employee 
			FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE ON UPDATE RESTRICT;"
	execute "ALTER TABLE employees_days ADD CONSTRAINT fk_employees_days_day 
			FOREIGN KEY (day_id) REFERENCES days(id) ON DELETE CASCADE ON UPDATE RESTRICT;"
  end
end
