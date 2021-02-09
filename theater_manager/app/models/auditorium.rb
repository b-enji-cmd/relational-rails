class Auditorium < ApplicationRecord
  validates :name, :capacity, presence: true

  has_many :movies, dependent: :destroy
end
