class Auditorium < ApplicationRecord
  validates :name, :capacity, presence: true

end
