require 'rails_helper'

describe Theater, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
  	it { should have_many :employees }
  end

  describe 'class methods' do
    it '::order_created_at_desc' do
      theater_1 = Theater.create(name: 'Harkins',
                              is_open: true,
                              location: 'Denver',
                              capacity: 200)
      theater_2 = Theater.create(name: 'United',
                              is_open: true,
                              location: 'Denver',
                              capacity: 200)
      expect(Theater.order_created_at_desc.first).to eq(theater_2)

    end
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

    it '#filtered_by_hours'do
      theater_1 = Theater.create(name: 'Harkins',
                              is_open: true,
                              location: 'Denver',
                              capacity: 200)

      employee_1 = theater_1.employees.create(name: 'Mark',
                                is_full_time: true,
                                hours_worked: 90)
      employee_2 = theater_1.employees.create(name: 'Greg',
                                is_full_time: true,
                                hours_worked: 30)

      expect(theater_1.filtered_by_hours(70).length).to eq(1)

    end

    it '#sort_by_name' do
      theater_1 = Theater.create(name: 'Harkins',
                              is_open: true,
                              location: 'Denver',
                              capacity: 200)

      employee_1 = theater_1.employees.create(name: 'Mark',
                                is_full_time: true,
                                hours_worked: 90)
      employee_2 = theater_1.employees.create(name: 'Greg',
                                is_full_time: true,
                                hours_worked: 30)

      expect(theater_1.sort_by_name.first).to eq(employee_2)
      expect(theater_1.sort_by_name.last).to eq(employee_1)
    end

  end

end