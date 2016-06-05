class VacationController < ApplicationController

before_filter :find_page, only: [:edit, :update, :destroy]

 @@vacations_type = 2
    

 def index
 @vacations = EmployeesDay.all
				.joins('INNER JOIN days ON days.id = employees_days.day_id')
				.where('kind = ? AND days.date >= ?', @@vacations_type, Date.current)
				.order('employee_id DESC, day_id ASC')
 end
 
 def destroy
  	@vacation_delete = EmployeesDay
  		.where('id >= ? AND id <= ? AND kind = ?',params[:startid], params[:endid], @@vacations_type)

  	if @vacation_delete.destroy_all
  		redirect_to vacation_path
  	else
  		redirect_to vacation_path, error: 'Не удалось удалить отпуск'
  	end
 end

 def new
 	@vacation = EmployeesDay.new
 end

 def create
 	
  	day_start = Date.parse(page_params[:day_start])
 	day_end = Date.parse(page_params[:day_end])
 	if day_start > day_end
 		render :new
 	end
	employee_id = page_params[:employee_id] 	  	

	vacation = EmployeesDay.new
  	vacation.set_new_vacantions day_start, day_end, employee_id, @@vacations_type    

  	redirect_to vacation_path
 end

 def edit
 end

 def update
 end

 def find_page
  	@vacation = EmployeesDay.find_by_id(params[:id])  	
 end

 private
	  def page_params
	  	params[:employees_day].permit(:employee_id, :day_id, :day_start, :day_end)
	  end

end
