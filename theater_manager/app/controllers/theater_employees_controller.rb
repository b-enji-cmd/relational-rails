class TheaterEmployeesController < ApplicationController

	def index
		@theater = Theater.find(params[:id])
		if params[:employee]
      hours_worked_filter = params[:employee][:hours_worked]
      @employees = @theater.filtered_by_hours(hours_worked_filter)
    elsif params[:alphabet]
      @employees = @theater.sort_by_name
    else
      @employees = @theater.employees
    end
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