class Theater < ApplicationRecord
	has_many :employees, dependent: :destroy
	validates :name, presence: true

	def self.order_created_at_desc
    order(created_at: :desc)
  end

  def employee_count
  	employees.length
  end

  def filtered_by_hours(hours_worked_filter)
  	employees.where("hours_worked >= #{hours_worked_filter}")
  end

  def sort_by_name
  	employees.order("lower(name)")
  end
  
end