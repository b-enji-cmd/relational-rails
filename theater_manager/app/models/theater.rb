class Theater < ApplicationRecord
	has_many :employees, dependent: :destroy
	validates :name, presence: true

	def self.order_created_at_desc
    order(created_at: :desc)
  end
  
end