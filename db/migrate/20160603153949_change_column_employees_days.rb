class ChangeColumnEmployeesDays < ActiveRecord::Migration
  def change
    
	execute "ALTER TABLE employees_days CHANGE COLUMN `id` `id` int(11) unsigned NOT NULL AUTO_INCREMENT;"
  end
end
