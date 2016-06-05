class DayoffController < ApplicationController
   
   before_filter :find_page, only: [:edit, :update, :destroy]

   @@dayoffs_type = 1
   @@dayoffs_pagination = 100
   

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
  		redirect_to dayoff_path, error: 'Не удалось удалить выходной или отгул'
  	end
 end

 def new
  	@dayoff = EmployeesDay.new
 end

 def create
  	@dayoff = EmployeesDay.new
  	@day = Day.find_by date: Date.parse(page_params[:day_start]);
  	@dayId = @day.id
  	@employeeId = page_params[:employee_id]
  	
  	@isExistEmployeesDay = EmployeesDay
		.where('employee_id = ? AND day_id = ?', @employeeId, @dayId)
	if @isExistEmployeesDay
		@isExistEmployeesDay.destroy_all
	end
		
  	@dayoff.day_id = @dayId;
	@dayoff.employee_id = @employeeId
  	@dayoff.kind = @@dayoffs_type
  
  	if @dayoff.save
  		redirect_to dayoff_path
  	else
  		render :new
  	end
 end

 def edit
 end

 def update
  	@dayId = page_params[:day_id]
  	@employeeId = page_params[:employee_id]

  	@isExistEmployeesDay = EmployeesDay
		.where('employee_id = ? AND day_id = ?', @employeeId, @dayId)
	if @isExistEmployeesDay
		@isExistEmployeesDay.destroy_all
	end

  	if @dayoff.update(page_params)
  		redirect_to dayoff_path
  	else
  		render :edit
  	end
 end


 private
	  def page_params
	  	params[:employees_day].permit(:employee_id, :day_id, :day_start, :day_end)
	  end

 def find_page
  	@dayoff = EmployeesDay.find_by_id(params[:id])  	
 end

end
