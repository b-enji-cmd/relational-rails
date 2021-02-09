require 'rails_helper'

RSpec.describe 'When I visit the theater index', type: :feature do
  it 'and I click a theater I have the option to delete' do
   

 		theater_1 = Theater.create(name: 'Harkins',
															is_open: true,
															location: 'Denver',
															capacity: 200)
    visit "/theaters"
    click_link("Harkins")

    expect(current_path).to eq("/theaters/#{theater_1.id}")
    expect(page).to have_link(href: "/theaters/#{theater_1.id}")

    click_link("delete")

    expect(current_path).to eq("/theaters")
    expect(page).not_to have_content("Harkins")
  end
end
