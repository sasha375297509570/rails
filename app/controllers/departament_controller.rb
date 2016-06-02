class DepartamentController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@departaments = Departament.all
  end
end
