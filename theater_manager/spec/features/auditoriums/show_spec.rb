require 'rails_helper'

RSpec.describe 'When I visit auditorium index', type: :feature do

  it 'I can view all information for a selected auditorium' do
    Auditorium.destroy_all

    auditorium_1 = Auditorium.create( name: "East 1",
                                      capacity: 100,
                                      is_imax_auditorium: true)
    auditorium_2 = Auditorium.create!( name: "North 2",
                                      capacity: 100,
                                      is_imax_auditorium: true)

    movie_1 = auditorium_1.movies.create!( name: "The Big Lebowski",
                            showtime_date: "2021-02-12",
                            showtime_start: "13:00:00",
                            duration: 110,
                            ticket_cost: 10.00,
                            is_rated_r: true)
    movie_2 = auditorium_1.movies.create!( name: "The Big Lebowski",
                            showtime_date: "2021-02-12",
                            showtime_start: "15:15:00",
                            duration: 110,
                            ticket_cost: 10.00,
                            is_rated_r: true)
    movie_3 = auditorium_2.movies.create!( name: "Star Wars: A New Hope",
                            showtime_date: "2021-02-12",
                            showtime_start: "16:00:00",
                            duration: 108,
                            ticket_cost: 12.00,
                            is_rated_r: false)
    visit "/auditoriums"

    click_link("East 1")

    expect(current_path).to eq("/auditoriums/#{auditorium_1.id}")
    expect(page).to have_link(href: "/auditoriums")
    expect(page).to have_content("East 1")
    expect(page).to have_content("Capacity: 100")
    expect(page).to have_content("IMAX Auditorium: Yes")
    expect(page).to have_content("Movies Total: 2")
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

  describe 'and I select a link to one auditorium' do
    it 'it has links to index, edit, and delete' do
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

    it 'it links to the movies associated to that auditorium' do
      Auditorium.destroy_all

      auditorium_1 = Auditorium.create( name: "East 1",
                                        capacity: 100,
                                        is_imax_auditorium: true)
      auditorium_2 = Auditorium.create!( name: "North 2",
                                        capacity: 100,
                                        is_imax_auditorium: true)

      movie_1 = auditorium_1.movies.create!( name: "The Big Lebowski",
                              showtime_date: "2021-02-12",
                              showtime_start: "13:00:00",
                              duration: 110,
                              ticket_cost: 10.00,
                              is_rated_r: true)
      movie_2 = auditorium_1.movies.create!( name: "The Big Lebowski",
                              showtime_date: "2021-02-12",
                              showtime_start: "15:15:00",
                              duration: 110,
                              ticket_cost: 10.00,
                              is_rated_r: true)
      movie_3 = auditorium_2.movies.create!( name: "Star Wars: A New Hope",
                              showtime_date: "2021-02-12",
                              showtime_start: "16:00:00",
                              duration: 108,
                              ticket_cost: 12.00,
                              is_rated_r: false)


      visit "/auditoriums"
      click_link("East 1")

      expect(current_path).to eq("/auditoriums/#{auditorium_1.id}")

      click_link("Movies")

      expect(current_path).to eq("/auditoriums/#{auditorium_1.id}/movies")
      expect(page).to have_content("The Big Lebowski")
      expect(page).to have_content("Movie Starts: Fri Feb 12 2021 03:15 PM")
      expect(page).to have_content("Auditorium: East 1")
      expect(page).not_to have_content("Star Wars: A New Hope")
    end
  end
end
