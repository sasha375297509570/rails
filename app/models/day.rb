class Day < ActiveRecord::Base
	has_many :employees_days
	has_many :employees, through: :employees_days
end
