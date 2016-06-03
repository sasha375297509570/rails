class RenameColumnEmployeesDays < ActiveRecord::Migration
  def change
    
	execute "ALTER TABLE `employees_days` CHANGE COLUMN `type` `kind` ENUM('1', '2') NOT NULL;"
  end
end
