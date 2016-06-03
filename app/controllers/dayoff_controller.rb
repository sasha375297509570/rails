class DayoffController < ApplicationController
   
   before_filter :find_page, only: [:destroy]

   @@dayoffs_type = 1
   @@dayoffs_pagination = 100
   

 def index
   	@dayoffs = EmployeesDay.paginate(page: params[:page], per_page: @@dayoffs_pagination)
  					.where('kind = ?', @@dayoffs_type)
  					.order('employee_id DESC, day_id ASC')
 end

 def edit
 end

 def destroy
  	if @dayoff.destroy
  		redirect_to dayoff_path
  	else
  		redirect_to dayoff_path, error: 'Не удалось удалить отдел'
  	end
 end

 def find_page
  	@dayoff = EmployeesDay.find(params[:id])
 end

end
