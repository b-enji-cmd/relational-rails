require 'rails_helper'

RSpec.describe 'when I visit a theater id' do
	it 'I can see the attributes for that theater' do
		theater_1 = Theater.create(name: 'Harkins',
															is_open: true,
															location: 'Denver',
															capacity: 200)

		employee_1 = theater_1.employees.create(name: 'Mark',
																is_full_time: true,
																hours_worked: 90)
		employee_2 = theater_1.employees.create(name: 'Greg',
																is_full_time: true,
																hours_worked: 15)

		visit '/theaters'
		click_link("Harkins")

		expect(page).to have_link(href: '/theaters')

		expect(page).to have_content(theater_1.name)
		expect(page).to have_content(theater_1.capacity)
		expect(page).to have_content(theater_1.location)
		expect(page).to have_content(theater_1.is_open)
		expect(page).to have_content("Employee Total: 2")
	end

	it 'I can see links to edit and delete the theater' do
		theater_1 = Theater.create(name: 'Harkins',
															is_open: true,
															location: 'Denver',
															capacity: 200)
		visit '/theaters'

		click_link("Harkins")
		expect(page).to have_link(href: "/theaters")
		expect(page).to have_link(href: "/theaters/#{theater_1.id}/edit")
		expect(page).to have_link(href: "/theaters/#{theater_1.id}/employees")
		expect(page).to have_link(href: "/theaters/#{theater_1.id}")

	end
end