require 'rails_helper'
RSpec.describe 'When I visit the theaters index page', type: :feature do
	it 'shows all theaters names and attributes' do
		theater_1 = Theater.create(name: 'Harkins',
															is_open: true,
															location: 'Denver',
															capacity: 200)

		visit '/theaters'

		expect(page).to have_content(theater_1.name)
	end

	it 'has a link to return to the welcome page' do
		visit '/theaters'

		expect(page).to have_link(href: '/')
	end

	it 'has a link to create a new theater' do
		visit '/theaters'

		expect(page).to have_link(href: '/theaters/new')

		click_link 'New Theater'

    expect(page).to have_current_path('/theaters/new')
	end


end