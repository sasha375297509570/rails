class DepartamentController < ApplicationController
  before_filter :authenticate_user!

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

  end

  def destroy

  end

  private
	  def page_params
	  	params[:departament].permit(:name)
	  end

end
