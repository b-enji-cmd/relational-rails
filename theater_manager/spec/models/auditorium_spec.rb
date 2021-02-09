require 'rails_helper'

RSpec.describe Auditorium, type: :model do
  describe 'relationships' do
    it { should have_many :movies }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:capacity) }
  end

  describe 'class methods' do
    it '::ordered_by_created_at'do
      auditorium_1 = Auditorium.create( name: "North 1",
                                        capacity: 50,
                                        is_imax_auditorium: true)
      # sleep(2)
      auditorium_2 = Auditorium.create( name: "North 2",
                                        capacity: 100,
                                        is_imax_auditorium: true)

      expect(Auditorium.order_created_at_desc.first).to eq(auditorium_2)
    end
  end
end
