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
			is_open: params[:theater][:is_open]||false,
			capacity: params[:theater][:capacity]
		})

		theater.save

		redirect_to '/theaters'
	end

	def show
		@theater = Theater.find(params[:id])
	end

	def edit
		@theater = Theater.find(params[:id])
	end

	def update
		theater = Theater.find(params[:id])
		theater.update({
			name: params[:theater][:name],
			location: params[:theater][:location],
			is_open: params[:theater][:is_open],
			capacity: params[:theater][:capacity]
		})
		theater.save
		redirect_to "/theaters/#{theater.id}"
	end

	def destroy
		Theater.destroy(params[:id])
		redirect_to '/theaters'
	end
	
end