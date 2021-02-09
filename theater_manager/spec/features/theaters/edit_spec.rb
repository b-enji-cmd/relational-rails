require 'rails_helper'
RSpec.describe 'When I visit the theater index' do
	it 'I can update a given theater' do
		theater_1 = Theater.create(name: 'Harkins',
															is_open: true,
															location: 'Denver',
															capacity: 200)
		visit '/theaters'
		click_link('Harkins')
		expect(page).to have_link(href: "/theaters/#{theater_1.id}/edit")
		click_link('Edit')

		expect(current_path).to eq("/theaters/#{theater_1.id}/edit")
    expect(page).to have_content("Edit")

   	fill_in('theater[name]', with: 'United')
    fill_in('theater[location]', with: 'Denver')
    check('theater[is_open]')
    fill_in('theater[capacity]', with: '300')
    click_button('Update Theater')

    expect(current_path).to eq("/theaters/#{theater_1.id}")
    expect(page).to have_content("Name: United")
    expect(page).to have_content("Location: Denver")
    expect(page).to have_content("Open: true")
    expect(page).to have_content("Maximum Capacity: 300")
	end
end