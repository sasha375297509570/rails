class EmployeesDay < ActiveRecord::Base

	validates :employee_id, presence: true
    validates :day_id, presence: true
	
	belongs_to :employee
	belongs_to :day

	def set_new_vacantions daystart, dayend, employee_id, kind
		
		day_start = Day.find_by date: daystart
	  	day_end = Day.find_by date: dayend
	  	
	  	day_start_id = day_start.id
	  	day_end_id = day_end.id
	  	
		vacation_delete = EmployeesDay
  			.where('day_id >= ? AND day_id <= ? AND employee_id = ?', day_start_id, day_end_id, employee_id)
  		vacation_delete.destroy_all

  		days = Day.where('id >= ? AND id <= ?', day_start_id, day_end_id);

  		cnt = 0;
  		sql = "INSERT INTO `employees_days` (employee_id, day_id, kind) VALUES "
  		days.each do |day|
		  	cnt += 1
		  	if days.length != cnt
		  		sql = sql + " (#{employee_id}, #{day.id}, #{kind}),"
		  	else
		  		sql = sql + " (#{employee_id}, #{day.id}, #{kind});"
		  	end
		end
		
		ActiveRecord::Base.connection.execute(sql)
	end		
end
