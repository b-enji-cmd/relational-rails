require 'rails_helper'

RSpec.describe 'When I visit auditorium index', type: :feature do
  it 'and I select a link to one auditorium I can delete it' do
    Auditorium.destroy_all

    auditorium_1 = Auditorium.create( name: "East 1",
                                      capacity: 100,
                                      is_imax_auditorium: true)
    visit "/auditoriums"
    click_link("East 1")

    expect(current_path).to eq("/auditoriums/#{auditorium_1.id}")

    click_link("Delete Auditorium")

    expect(current_path).to eq("/auditoriums")
    expect(page).not_to have_content("East 1")
  end
end
