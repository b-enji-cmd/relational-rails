require 'rails_helper'
RSpec.describe 'When I visit an employee show page' do
	it 'I can see the attributes for that employee' do
		theater_1 = Theater.create!(name: 'Harkins',
                              is_open: true,
                              location: 'Denver',
                              capacity: 200)
  

    employee_1 = theater_1.employees.create(name: 'Mark',
                                            is_full_time: true,
                                            hours_worked: 90)
		visit '/theaters'
		click_link('Harkins')
		click_link('Employees')


		expect(current_path).to eq("/theaters/#{theater_1.id}/employees")
    expect(page).to have_content(employee_1.name)
    expect(page).to have_content(employee_1.hours_worked)

	end
end