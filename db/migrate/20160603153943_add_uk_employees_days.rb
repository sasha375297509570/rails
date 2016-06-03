class AddUkEmployeesDays < ActiveRecord::Migration
  def change
    	
	execute "ALTER TABLE employees_days ADD UNIQUE KEY (employee_id, day_id);"
  end
end
