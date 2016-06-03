class Departament < ActiveRecord::Base
	validates :name, presence: true
	
	has_many :employee
end
