class TheaterController < ApplicationController
	before_filter :find_model

	

	private
	def find_model
		@model = Theater.find(params[:id]) if params[:id]
	end
end