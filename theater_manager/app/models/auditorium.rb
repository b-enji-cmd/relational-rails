class Auditorium < ApplicationRecord
  validates :name, :capacity, presence: true

  has_many :movies, dependent: :destroy

  def self.order_created_at_desc
    order(created_at: :desc)
  end
end
