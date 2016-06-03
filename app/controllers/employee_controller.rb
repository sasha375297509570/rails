class EmployeeController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_page, only: [:edit, :update, :show, :destroy]
  
  
  @@employee_pagination = 30
  
  def index
  	@employees = Employee.paginate(page: params[:page], per_page: @@employee_pagination)
  end

  def new
  	@employee = Employee.new
  end

  def create
  	@employee = Employee.new(page_params)

  	if @employee.save
  		redirect_to employee_path
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @employee.update(page_params)
  		redirect_to employee_path
  	else
  		render :edit
  	end
  end
  

  def destroy
  	if @employee.destroy
  		redirect_to employee_path
  	else
  		redirect_to employee_path, error: 'Не удалось удалить отдел'
  	end
  end

  private
	  def page_params
	  	params[:employee].permit(:name, :departament_id)
	  end

  def find_page
  	@employee = Employee.find(params[:id])
  end
    
end
