class Employee < ActiveRecord::Base
  validates :departament_id, presence: true
  validates :name, presence: true

  belongs_to :departament
  
  has_many :employees_days
  has_many :days, through: :employees_days
end
