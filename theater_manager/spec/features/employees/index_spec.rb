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

    it 'has a link to edit an employee next to each element' do
      theater_1 = Theater.create!(name: 'Harkins',
                              is_open: true,
                              location: 'Denver',
                              capacity: 200)
  

      employee_1 = theater_1.employees.create(name: 'Mark',
                                              is_full_time: true,
                                              hours_worked: 90)
      employee_2 = theater_1.employees.create(name: 'Greg',
                                              is_full_time: true,
                                              hours_worked: 15)

      visit 'employees'

      expect(page).to have_link(href: "/employees/#{employee_1.id}/edit")
      expect(page).to have_link(href: "/employees/#{employee_2.id}/edit")

      click_link("Edit Mark")

      fill_in('employee[name]', with: 'Greg')
      check('employee[is_full_time]')
      fill_in('employee[hours_worked]', with: '300')
      click_button('Update Employee')

      expect(current_path).to eq("/employees/#{employee_1.id}")
      expect(page).to have_content("Greg")



    end

    it 'has a button to delete element next to each' do

      theater_1 = Theater.create!(name: 'Harkins',
                              is_open: true,
                              location: 'Denver',
                              capacity: 200)
  

      employee_1 = theater_1.employees.create(name: 'Mark',
                                              is_full_time: true,
                                              hours_worked: 90)
      employee_2 = theater_1.employees.create(name: 'Greg',
                                              is_full_time: true,
                                              hours_worked: 15)

      visit "/employees"

      expect(page).to have_button("Delete #{employee_1.name}")
      expect(page).to have_button("Delete #{employee_2.name}")

      click_button("Delete Mark")

      expect(page).not_to have_content("Mark")
      expect(current_path).to eq("/employees")
    end
  end
end
