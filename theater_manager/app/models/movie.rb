class Movie < ApplicationRecord
  validates :name, :showtime_start, :duration, presence: true

  belongs_to :auditorium
end
