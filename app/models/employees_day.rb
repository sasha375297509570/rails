class EmployeesDay < ActiveRecord::Base
	validates :employee_id, presence: true
    validates :day_id, presence: true
	
	belongs_to :employee
	belongs_to :day
		
end
