class VerticalsController < ApplicationController

  before_action :authorize_user!
  
	def index
		verticals = Vertical.all
    render json: {
        verticals: verticals.as_json }, status: :ok
	end

  def show
    vertical = Vertical.find(params[:id])
    render json: {
        vertical: vertical.as_json, vertical_categories: vertical.categories.as_json }, status: :ok
  end
end