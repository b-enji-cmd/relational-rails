class Auditorium < ApplicationRecord
  validates :name, :capacity, presence: true

  has_many :movies, dependent: :destroy

  def self.order_created_at_desc
    order(created_at: :desc)
  end

  def movie_count
  	movies.length
  end

  def filtered_by_cost(ticket_cost_filter)
  	movies.where("ticket_cost >= #{ticket_cost_filter}")
  end

  def sort_by_name
  	movies.order("lower(name)")
  end
end
