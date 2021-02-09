require 'rails_helper'

RSpec.describe 'When I visit the theaters index' do

	it'I can navigate to create a new theater'do
		visit "/theaters"
		click_link("New Theater")

		expect(current_path).to eq("/theaters/new")


		expect(page).to have_content("Enter a new Theater:")
    expect(page).to have_content("Name: ")
    expect(page).to have_content("Location: ")
    expect(page).to have_content("Open? ")
    expect(page).to have_content("Maximum Occupants")
	end

	it 'I can fill out a form and create a theater' do
		visit "/theaters"
		click_link("New Theater")

    fill_in('theater[name]', with: 'United')
    fill_in('theater[location]', with: 'Denver')
    check('theater[is_open]')
    fill_in('theater[capacity]', with: '300')
    click_button('Create Theater')

    expect(page).to have_content('United')
	end
end