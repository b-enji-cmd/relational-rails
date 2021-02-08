class EmployeesController < ApplicationController
	def index
		@employees = Employee.all
	end

	def show
		@employee = Employee.find(params[:id])
	end

	def edit
		@employee = Employee.find(params[:id])
	end

	def update
		employee = Employee.find(params[:id])
		employee.update({
			name: params[:employee][:name],
			is_full_time: params[:employee][:is_full_time]||false,
			hours_worked: params[:employee][:hours_worked]
		})
		employee.save
		redirect_to "/employees/#{employee.id}"
	end

	def destroy
		Employee.destroy(params[:id])
		redirect_to '/employees'
	end

end