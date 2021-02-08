require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it { should belong_to :auditorium }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:showtime_date) }
    it { should validate_presence_of(:showtime_start) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:ticket_cost) }
  end
end
