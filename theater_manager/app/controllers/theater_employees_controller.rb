class TheaterEmployeeController < ApplicationController

	def find_model
		@model = TheaterEmployee.find(params[:id]) if params[:id]
	end
	
end