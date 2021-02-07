require 'rails_helper'

RSpec.describe 'auditoriums index page', type: :feature do

  it 'can display all auditoriums names' do
    auditorium_1 = Auditorium.create( name: "North 1",
                                      capacity: 50,
                                      is_imax_auditorium: true)

    auditorium_2 = Auditorium.create( name: "North 2",
                                      capacity: 100,
                                      is_imax_auditorium: true)

    visit '/auditoriums'

    expect(page).to have_content(auditorium_1.name)
    expect(page).to have_content(auditorium_2.name)
  end

  it 'has link and redirects to auditoriums/new' do
    visit 'auditoriums'

    expect(page).to have_link(href: '/auditoriums/new')

    click_link 'New Auditorium'
    save_and_open_page

    expect(page).to have_current_path('/auditoriums/new')
  end

  it 'has link to auditoriums/:id and displays all Auditorium data' do
    auditorium_1 = Auditorium.create( name: "North 1",
                                      capacity: 50,
                                      is_imax_auditorium: true)
    visit 'auditoriums'

    expect(page).to have_link(href: "/auditoriums/#{auditorium_1.id}")

    click_link 'North 1'
    save_and_open_page

    expect(page).to have_link(href: '/auditoriums')
    expect(page).to have_content("Auditorium Index")
    expect(page).to have_content("North 1")
    expect(page).to have_content("Capacity: 50")
    expect(page).to have_content("IMAX Auditorium: Yes")
    expect(page).to have_content("Edit Auditorium")
    expect(page).to have_content("Delete Auditorium")
    expect(page).to have_link(href: "/auditoriums/#{auditorium_1.id}")
  end
end
