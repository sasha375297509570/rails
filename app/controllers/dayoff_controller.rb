class DayoffController < ApplicationController
   
   before_filter :find_page, only: [:destroy]

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
  	@dayoff.day_id = @day.id;
  	@dayoff.kind = @@dayoffs_type
  
  	if @dayoff.save
  		redirect_to dayoff_path
  	else
  		render :new
  	end
 end

 def edit
 end


 private
	  def page_params
	  	params[:employees_day].permit(:employee_id, :day_id)
	  end

 def find_page
  	@dayoff = EmployeesDay.find(params[:id])
 end

end
