class CategoriesController < ApplicationController

  before_action :authorize_user!
  
	def index
		categories = Categories.all
    render json: {
        categories: categories.as_json }, status: :ok
	end

  def show
    category = Category.find(params[:id])
    render json: {
        category: category.as_json, category_courses: category.courses.as_json }, status: :ok
  end
end