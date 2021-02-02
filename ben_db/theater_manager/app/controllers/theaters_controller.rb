class TheatersController < ApplicationController
	before_filter :find_model

	

	private
	def find_model
		@model = Theaters.find(params[:id]) if params[:id]
	end
end