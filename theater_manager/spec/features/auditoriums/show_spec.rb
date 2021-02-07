require 'rails_helper'

RSpec.describe 'When I visit auditorium index', type: :feature do

  it 'I can view all information for a selected auditorium' do
    Auditorium.destroy_all

    auditorium_1 = Auditorium.create( name: "East 1",
                                      capacity: 100,
                                      is_imax_auditorium: true)
    visit "/auditoriums"

    click_link("East 1")

    expect(current_path).to eq("/auditoriums/#{auditorium_1.id}")
    expect(page).to have_link(href: "/auditoriums")
    expect(page).to have_content("East 1")
    expect(page).to have_content("Capacity: 100")
    expect(page).to have_content("IMAX Auditorium: Yes")
    expect(page).to have_link(href: "/auditoriums/#{auditorium_1.id}/edit")
    expect(page).to have_link(href: "/auditoriums/#{auditorium_1.id}")

    click_link("Auditorium Index")

    expect(current_path).to eq("/auditoriums")

    click_link("East 1")
    click_link("Edit Auditorium")

    expect(current_path).to eq("/auditoriums/#{auditorium_1.id}/edit")

    click_button("Update Auditorium")
    click_link("Delete Auditorium")

    expect(current_path).to eq("/auditoriums")
    expect(page).not_to have_content("East 1")
  end

  it 'and I select a link to one auditorium it has links to index, edit, and delete' do
    Auditorium.destroy_all

    auditorium_1 = Auditorium.create( name: "East 1",
                                      capacity: 100,
                                      is_imax_auditorium: true)
    visit "/auditoriums"
    click_link("East 1")

    expect(current_path).to eq("/auditoriums/#{auditorium_1.id}")

    click_link("Auditorium Index")

    expect(current_path).to eq("/auditoriums")

    click_link("East 1")
    click_link("Edit Auditorium")

    expect(current_path).to eq("/auditoriums/#{auditorium_1.id}/edit")

    click_button("Update Auditorium")
    click_link("Delete Auditorium")

    expect(current_path).to eq("/auditoriums")
    expect(page).not_to have_content("East 1")
  end
end
