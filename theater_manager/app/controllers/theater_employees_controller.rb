class TheaterEmployeesController < ApplicationController

	def index
		@theater = Theater.find(params[:id])
		@employees = @theater.employees
	end

	def new
		@theater = Theater.find(params[:id])
	end

	def create
		@theater = Theater.find(params[:id])
		employee = Employee.new({
			name: params[:employee][:name],
			is_full_time: params[:employee][:is_full_time]||false,
			hours_worked: params[:employee][:hours_worked],
			theater_id: params[:employee][:theater_id]
		})
		employee.save
		
		redirect_to "/theaters/#{@theater.id}/employees"
	end
	
end