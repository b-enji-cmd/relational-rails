require 'rails_helper'

RSpec.describe 'When I visit movies index page', type: :feature do
  describe 'displays all movies' do
    it 'that are rated r and the data for each' do
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

      visit '/movies'

      expect(page).to have_content(movie_1.name)
      expect(page).to have_content(movie_2.name)
      expect(page).not_to have_content(movie_3.name)
      expect(page).to have_content("Movie Starts: Fri Feb 12 2021 03:15 PM")
    end

    it 'and a link to edit next to each movie' do

      auditorium_1 = Auditorium.create( name: "East 1",
                                        capacity: 100,
                                        is_imax_auditorium: true)
      auditorium_2 = Auditorium.create!( name: "North 2",
                                        capacity: 100,
                                        is_imax_auditorium: true)

      movie_1 = auditorium_1.movies.create!( name: "The Rugrats",
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

      visit 'movies'

      expect(page).to have_link(href: "/movies/#{movie_1.id}/edit")
      expect(page).to have_link(href: "/movies/#{movie_2.id}/edit")

      click_link("Edit The Big Lebowski")

      date = Date.today.strftime("%a %b %d %Y")
      time = Time.now.strftime("%H:%M:%S")
      display_time = Time.now.strftime("%I:%M %p")

      expect(current_path).to eq("/movies/#{movie_2.id}/edit")
      expect(page).to have_content("Editing The Big Lebowski Movie")
      fill_in('movie[name]', with: 'The Big Chill')
      fill_in('movie[showtime_date]', with: date)
      fill_in('movie[showtime_start]', with: time)
      fill_in('movie[duration]', with: '120')
      fill_in('movie[ticket_cost]', with: '11.00')
      choose('movie_is_rated_r_false')
      click_button('Update Movie')

      expect(current_path).to eq("/movies/#{movie_2.id}")
      expect(page).to have_content("The Big Chill")
      expect(page).to have_content("Movie Starts: #{date} #{display_time}")
      expect(page).to have_content("Duration: 120")
      expect(page).to have_content("Ticket Cost: $11.00")
      expect(page).to have_content("Rated R: No")
      expect(page).to have_content("Auditorium: East 1")

    end

    it 'has a button to delete the movie next to each element' do
        auditorium_1 = Auditorium.create( name: "East 1",
                                        capacity: 100,
                                        is_imax_auditorium: true)
        auditorium_2 = Auditorium.create!( name: "North 2",
                                          capacity: 100,
                                          is_imax_auditorium: true)

        movie_1 = auditorium_1.movies.create!( name: "The Rugrats",
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

        expect(page).to have_button("Delete #{movie_1.name}")
        expect(page).to have_button("Delete #{movie_2.name}")

        click_button("Delete The Rugrats")

        expect(page).not_to have_content("The Rugrats")
        expect(current_path).to eq("/movies")


      end
  end
end
