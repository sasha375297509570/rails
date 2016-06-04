class EmployeesDay < ActiveRecord::Base
	@date

	validates :employee_id, presence: true
	
	belongs_to :employee
	belongs_to :day
		
end
