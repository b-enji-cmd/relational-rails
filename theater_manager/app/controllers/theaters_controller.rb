class TheatersController < ApplicationController

	def index
		@theaters = Theater.all
	end

	def new
		
	end

	def create
		theater = Theater.new({
			name: params[:theater][:name],
			location: params[:theater][:location],
			is_open: params[:theater][:is_open],
			capacity: params[:theater][:capacity]
		})

		theater.save

		redirect_to '/theaters'
	end
	
end