class Movie < ApplicationRecord
  validates :name, :showtime_date, :showtime_start, :duration, :ticket_cost, presence: true

  belongs_to :auditorium
end
