class DayoffController < ApplicationController

 def index
  	@dayoffs = EmployeesDay.all
 end

 def edit
 end

end
