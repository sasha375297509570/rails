class AddColumnDays < ActiveRecord::Migration
  def change
    
	execute "ALTER TABLE employees_days DROP COLUMN date;"
	execute "ALTER TABLE days ADD COLUMN date DATE NOT NULL AFTER id;"
  end
end
