class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @vents = @category.vents.limit(10)
    @categories = Category.all
  end
end
