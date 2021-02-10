require 'rails_helper'

describe Theater, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
  	it { should have_many :employees }
  end

  describe'instance methods' do
  	it'#employee_count'do
  		theater_1 = Theater.create(name: 'Harkins',
															is_open: true,
															location: 'Denver',
															capacity: 200)

			employee_1 = theater_1.employees.create(name: 'Mark',
																is_full_time: true,
																hours_worked: 90)

			expect(theater_1.employee_count).to eq(1)
  	end
  end

end