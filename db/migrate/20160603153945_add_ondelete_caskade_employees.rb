class AddOndeleteCaskadeEmployees < ActiveRecord::Migration
  def change
    
	execute "ALTER TABLE employees DROP FOREIGN KEY fk_rails_65e1e8ecf5;"
	execute "ALTER TABLE employees ADD CONSTRAINT fk_employees_departament
			FOREIGN KEY (departament_id) REFERENCES departaments(id) ON DELETE CASCADE ON UPDATE RESTRICT;"
  end
end
