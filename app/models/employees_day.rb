class EmployeesDay < ActiveRecord::Base
	belongs_to :employee
	belongs_to :day
		
end
