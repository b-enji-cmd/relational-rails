require 'rails_helper'

RSpec.describe 'When I visit movies index', type: :feature do
  describe 'and I select a link to one auditorium' do
    it 'I can view all information for that movie' do
      Auditorium.destroy_all
      Movie.destroy_all

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
      visit "/movies"

      click_link("The Big Lebowski", match: :first)

      expect(current_path).to eq("/movies/#{movie_1.id}")
      expect(page).to have_link(href: "/movies")
      expect(page).to have_content("Movie Starts: Fri Feb 12 2021 01:00 PM")
      expect(page).to have_content("Auditorium: East 1")
      expect(page).to have_link(href: "/movies/#{movie_1.id}/edit")
      expect(page).to have_link(href: "/movies/#{movie_1.id}")
    end

    it 'it has links to index, edit, and delete' do
      Auditorium.destroy_all
      Movie.destroy_all

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
                              is_rated_r: true)

      visit "/movies"
      click_link("Star Wars: A New Hope")

      expect(current_path).to eq("/movies/#{movie_3.id}")

      click_link("Movie Index")

      expect(current_path).to eq("/movies")

      click_link("Star Wars: A New Hope")
      click_link("Edit Movie")

      expect(current_path).to eq("/movies/#{movie_3.id}/edit")

      click_button("Update Movie")
      click_link("Delete Movie")

      expect(current_path).to eq("/movies")
      expect(page).not_to have_content("Star Wars: A New Hope")
    end
  end
end
