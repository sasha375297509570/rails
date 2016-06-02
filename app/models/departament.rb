class Departament < ActiveRecord::Base
	validates :name, presence: true
end
