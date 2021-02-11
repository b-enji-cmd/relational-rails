require 'rails_helper'

RSpec.describe 'When I visit the theater employees index page', type: :feature do
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
     

      visit "theaters/#{theater_1.id}/employees"

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

      visit "theaters/#{theater_1.id}/employees"

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
    it 'has a link to filter by alphabetical order' do
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

        visit "/theaters/#{theater_1.id}/employees"
        click_link("Sort")
        
        expect(employee_2.name).to appear_before(employee_1.name)
        
      
      end

    it 'can filter for hours_worked greater than given number' do
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
      visit "/theaters/#{theater_1.id}/employees"


      fill_in('employee[hours_worked]', with: "30")
      click_button("filter_button")
      expect(current_path).to eq("/theaters/#{theater_1.id}/employees")
      expect(page).to have_content("Hours Worked: 90")
      expect(page).not_to have_content("Hours Worked: 15")
    end
  end
end
