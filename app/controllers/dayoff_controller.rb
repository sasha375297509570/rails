class DayoffController < ApplicationController
   
   before_filter :find_page, only: [:update, :destroy]

   @@dayoffs_type = 1
   @@dayoffs_pagination = 5
   

 def index
@dayoffs = EmployeesDay.paginate(page: params[:page], per_page: @@dayoffs_pagination).
				joins('INNER JOIN days ON days.id = employees_days.day_id')
				.where('kind = ? AND days.date >= ?', @@dayoffs_type, Date.current)
				.order('employee_id DESC, day_id ASC')
 end
 
 def destroy
  	if @dayoff.destroy
  		redirect_to dayoff_path
  	else
  		redirect_to dayoff_path, error: 'Не удалось удалить отдел'
  	end
 end

 def new
  	@dayoff = EmployeesDay.new
 end

 def create
  	@dayoff = EmployeesDay.new(page_params)
  	@day = Day.find_by date: Date.parse(page_params[:day_id]);
  	@dayId = @day.id
  	@employeeId = page_params[:employee_id]
  	
  	@isExistEmployeesDay = EmployeesDay.where('employee_id = ? AND day_id = ?', @employeeId, @dayId)
	@isExistEmployeesDay.each do |isExist|
	  	if  isExist.id
	  		redirect_to dayoff_path
	  		return
	  	end
	end

  	@dayoff.day_id = @dayId;
  	@dayoff.kind = @@dayoffs_type
  
  	if @dayoff.save
  		redirect_to dayoff_path
  	else
  		render :new
  	end
 end

 def edit
 	@dayoff = EmployeesDay.find_by_id(params[:id])
  	@oldDay = @dayoff.day_id
  	@oldEmployee = @dayoff.employee_id
 end

 def update
  	@dayId = page_params[:day_id]
  	@employeeId = page_params[:employee_id]

  	@isExistEmployeesDay = EmployeesDay.where('employee_id = ? AND day_id = ?', @employeeId, @dayId)
	@isExistEmployeesDay.each do |isExist|
	  	if  isExist.id
	  		redirect_to dayoff_path
	  		return
	  	end
	end

  	if @dayoff.update(page_params)
  		redirect_to dayoff_path
  	else
  		render :edit
  	end
 end


private
	  def page_params
	  	params[:employees_day].permit(:employee_id, :day_id)
	  end

 def find_page
  	@dayoff = EmployeesDay.find_by_id(params[:id])  	
 end

end
