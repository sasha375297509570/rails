class AddColumnEmployeesDays < ActiveRecord::Migration
  def change
    
	execute "ALTER TABLE employees_days ADD COLUMN date DATE NOT NULL AFTER id;"
  end
end
