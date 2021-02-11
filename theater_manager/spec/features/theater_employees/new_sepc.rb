require 'rails_helper'

RSpec.describe 'When I visit theaters index', type: :feature do
	describe 'and select a theater' do
		describe'and select employees' do
			it 'can add a new employee relative to its parent theater' do
				theater_1 = Theater.create(name: 'Harkins',
															is_open: true,
															location: 'Denver',
															capacity: 200)

				visit 'theaters'
				click_link("Harkins")
				click_link("Employees")
				click_link("New Employee")

				expect(current_path).to eq("/theaters/#{theater_1.id}/employees/new")
				expect(page).to have_content("Enter a new Employee:")

				fill_in('employee[name]', with: 'Greg')
    		check('employee[is_full_time]')
    		fill_in('employee[hours_worked]', with: '90')
    		click_button("Create Employee")

    		expect(page).to have_content("Greg")
    		expect(page).to have_content('90')

			end

		end
	end

end
