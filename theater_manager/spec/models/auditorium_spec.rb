require 'rails_helper'

RSpec.describe Auditorium, type: :model do
  describe 'relationships' do
    it { should have_many :movies }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:capacity) }
  end
end
