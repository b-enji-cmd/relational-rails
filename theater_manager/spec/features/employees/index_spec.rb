require 'rails_helper'

RSpec.describe 'When I visit the employees index page', type: :feature do
  describe 'shows all employees' do
    it 'that are full time and the data for each' do
      theater_1 = Theater.create!(name: 'Harkins',
                              is_open: true,
                              location: 'Denver',
                              capacity: 200)
  

      employee_1 = theater_1.employees.create(name: 'Mark',
                                              is_full_time: true,
                                              hours_worked: 90)
      employee_2 = theater_1.employees.create(name: 'Greg',
                                              is_full_time: false,
                                              hours_worked: 15)
     

      visit '/employees'

      expect(page).to have_content(employee_1.name)
      expect(page).to have_content(employee_1.hours_worked)
      expect(page).not_to have_content(employee_2.name)
     
    end
  end
end
