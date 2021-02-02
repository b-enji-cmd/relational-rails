class TheatersController < ApplicationController

	def index
		@theaters = ['Theater 1', 'Theater 2','Theater 3']
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