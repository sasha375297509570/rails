class AddPkEmployeesDays < ActiveRecord::Migration
  def change
    
	execute "ALTER TABLE employees_days ADD COLUMN `id` int(11) unsigned NOT NULL FIRST;"
	execute "ALTER TABLE employees_days ADD PRIMARY KEY (id);"
  end
end
