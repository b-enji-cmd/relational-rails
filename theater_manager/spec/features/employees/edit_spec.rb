require 'rails_helper'
RSpec.describe 'When I visit an employee show page' do
	it 'I can update a given employee' do
		theater_1 = Theater.create!(name: 'Harkins',
                              is_open: true,
                              location: 'Denver',
                              capacity: 200)
  

     employee_1 = theater_1.employees.create(name: 'Mark',
                                            is_full_time: true,
                                            hours_worked: 90)
		visit "/theaters/#{theater_1.id}/employees"
		click_link("Mark")
		click_link('Edit')


		expect(current_path).to eq("/employees/#{employee_1.id}/edit")
    expect(page).to have_content("Edit")

   	fill_in('employee[name]', with: 'Greg')
    check('employee[is_full_time]')
    fill_in('employee[hours_worked]', with: '300')
    click_button('Update Employee')

    expect(current_path).to eq("/employees/#{employee_1.id}")
    expect(page).to have_content("Greg")

	end
end