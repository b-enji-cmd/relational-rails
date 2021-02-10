class Employee < ApplicationRecord
	validates :name, :is_full_time, :hours_worked, presence: true
	belongs_to :theater

	
end