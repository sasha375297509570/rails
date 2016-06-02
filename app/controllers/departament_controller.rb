class DepartamentController < ApplicationController
  before_filter :authenticate_user!, :find_page, only: [:edit, :update, :show, :destroy]

  def index
  	@departaments = Departament.all
  end

  def new
  	@departament = Departament.new
  end

  def create
  	@departament = Departament.new(page_params)

  	if @departament.save
  		redirect_to departament_index_path
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @department.update(page_params)
  		redirect_to departament_index_path
  	else
  		render :edit
  	end
  end

  def destroy
  	if @department.destroy
  		redirect_to departament_index_path
  	else
  		redirect_to departament_index_path, error: 'Не удалось удалить отдел'
  	end
  end

  private
	  def page_params
	  	params[:departament].permit(:name)
	  end

  def find_page
  	@department = Departament.find(params[:id])
  end

end
