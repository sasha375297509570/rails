class VacationController < ApplicationController

before_filter :find_page, only: [:edit, :update, :destroy]

 @@vacations_type = 2
 @@vacations_pagination = 40
   

 def index
 @vacations = EmployeesDay.paginate(page: params[:page], per_page: @@vacations_pagination).
				joins('INNER JOIN days ON days.id = employees_days.day_id')
				.where('kind = ? AND days.date >= ?', @@vacations_type, Date.current)
				.order('employee_id DESC, day_id ASC')
 end
 
 def destroy
  	
 end

 def new
 end

 def create
 end

 def edit
 end

 def update
 end

 private
	  def page_params
	  	params[:employees_day].permit(:employee_id, :day_id)
	  end

 def find_page
  	@vacation = EmployeesDay.find_by_id(params[:id])  	
 end

end
