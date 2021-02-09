require 'rails_helper'

RSpec.describe 'When I visit auditoriums index page', type: :feature do
  describe 'and I select one auditorium' do
    describe 'and I select the link movies' do
      it 'displays all movies and data for each movie' do
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
        click_link("Movies")

        expect(page).to have_content(movie_1.name)
        expect(page).to have_content(movie_2.name)
        expect(page).not_to have_content(movie_3.name)
        expect(page).to have_content("Movie Starts: Fri Feb 12 2021 03:15 PM")
      end
    end
  end
end