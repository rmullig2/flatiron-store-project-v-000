class CategoriesController < ApplicationController
  
  def show
    @category = Category.find(params[:id])
  end
  
  def index
    #code
  end

end
