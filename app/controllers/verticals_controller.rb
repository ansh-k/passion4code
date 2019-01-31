class VerticalsController < ApplicationController

  before_action :authorize_user!
  
	def index
		vericals = Vertical.all
    render json: {
        vericals: vericals.as_json }, status: :ok
	end

  def show
    vertical = Vertical.find_by(params[:id])
    render json: {
        vertical: vertical.as_json, vertical_categories: vertical.categories.as_json }, status: :ok
  end
end