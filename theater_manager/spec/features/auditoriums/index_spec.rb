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

  it 'has link to auditoriums/new' do
    visit 'auditoriums'

    expect(page).to have_link(href: '/auditoriums/new')
  end

  it 'has link to auditoriums/:id' do
    auditorium_1 = Auditorium.create( name: "North 1",
                                      capacity: 50,
                                      is_imax_auditorium: true)
    visit 'auditoriums'
    save_and_open_page

    expect(page).to have_link(href: "/auditoriums/#{auditorium_1.id}")
  end
end
