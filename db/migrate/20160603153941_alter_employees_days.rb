class AlterEmployeesDays < ActiveRecord::Migration
  def change
    
	execute "ALTER TABLE employees_days DROP PRIMARY KEY;"
  end
end
