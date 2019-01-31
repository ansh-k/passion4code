class CoursesController < ApplicationController

  before_action :authorize_user!
  
	def index
		courses = Course.all
    render json: {
        courses: courses.as_json }, status: :ok
	end

  def show
    course = Course.find_by(params[:id])
    render json: {
        course: course.as_json }, status: :ok
  end
end