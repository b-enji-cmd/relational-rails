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

      it 'can filter for ticket cost greater than given number' do
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
                                              ticket_cost: 12.00,
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

        fill_in('movie[ticket_cost]', with: "11")
        click_button("filter_button")
        expect(current_path).to eq("/auditoriums/#{auditorium_1.id}/movies")
        expect(page).to have_content("Ticket Cost: $12.00")
        expect(page).not_to have_content("Ticket Cost: $10.00")
      end

      it 'has a link to filter by alphabetical order' do
        auditorium_1 = Auditorium.create( name: "East 1",
                                          capacity: 100,
                                          is_imax_auditorium: true)
        auditorium_2 = Auditorium.create!( name: "North 2",
                                          capacity: 100,
                                          is_imax_auditorium: true)

        movie_1 = auditorium_1.movies.create!( name: "MOVIE_B",
                                              showtime_date: "2021-02-12",
                                              showtime_start: "13:00:00",
                                              duration: 110,
                                              ticket_cost: 10.00,
                                              is_rated_r: true)
        movie_2 = auditorium_1.movies.create!( name: "MOVIE_A",
                                              showtime_date: "2021-02-12",
                                              showtime_start: "15:15:00",
                                              duration: 110,
                                              ticket_cost: 12.00,
                                              is_rated_r: true)
        movie_3 = auditorium_1.movies.create!( name: "MOVIE_C",
                                              showtime_date: "2021-02-12",
                                              showtime_start: "16:00:00",
                                              duration: 108,
                                              ticket_cost: 12.00,
                                              is_rated_r: false)
        movie_4 = auditorium_2.movies.create!( name: "D",
                                              showtime_date: "2021-02-12",
                                              showtime_start: "16:00:00",
                                              duration: 108,
                                              ticket_cost: 12.00,
                                              is_rated_r: false)
        visit "/auditoriums"
        click_link("East 1")
        click_link("Movies")
        
      
        #expect(page).to have_link(href: "/auditoriums/#{auditorium_1.id}/movies")

        #expect(page).to have_text(/ \wMOVIE_B+MOVIE_A+MOVIE_C/)

        # click_link("Sort")
        #expect(current_path).to eq("/auditoriums/#{auditorium_1.id}/movies")
        # expect(page).to have_text(/A+B+C/)

        #expect(page.all('.movie')[0]).to have_link(href: "movies/#{movie_2.id}")
        
      
      end

      it 'displays an edit link next to each element' do
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

        visit "/auditoriums/#{auditorium_1.id}/movies"

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
      
    end
  end
end
