require 'rails_helper'

RSpec.describe 'When I visit movie index', type: :feature do
  describe 'and I select a movie' do
    it 'I can update only that movie' do
      Auditorium.destroy_all
      Movie.destroy_all

      auditorium_1 = Auditorium.create!( name: "East 1",
                                        capacity: 100,
                                        is_imax_auditorium: true)
      movie_1 = auditorium_1.movies.create!( name: "The Big Lebowski",
                              showtime_date: "2021-02-12",
                              showtime_start: "13:00:00",
                              duration: 110,
                              ticket_cost: 10.00,
                              is_rated_r: true)
      visit "/movies"

      click_link("The Big Lebowski")
      click_link("Edit Movie")

      date = Date.today.strftime("%a %b %d %Y")
      time = Time.now.strftime("%H:%M:%S")
      display_time = Time.now.strftime("%I:%M %p")

      expect(current_path).to eq("/movies/#{movie_1.id}/edit")
      expect(page).to have_content("Editing The Big Lebowski Movie")
      fill_in('movie[name]', with: 'The Big Chill')
      fill_in('movie[showtime_date]', with: date)
      fill_in('movie[showtime_start]', with: time)
      fill_in('movie[duration]', with: '120')
      fill_in('movie[ticket_cost]', with: '11.00')
      click_button('Update Movie')

      expect(current_path).to eq("/movies/#{movie_1.id}")
      expect(page).to have_content("The Big Chill")
      expect(page).to have_content("Movie Starts: #{date} #{display_time}")
      expect(page).to have_content("Duration: 120")
      expect(page).to have_content("Ticket Cost: $11.00")
      expect(page).to have_content("Auditorium: East 1")

      visit "/movies"
      

      click_link("The Big Chill")
      click_link("Edit Movie")

      expect(current_path).to eq("/movies/#{movie_1.id}/edit")
      expect(page).to have_content("Editing The Big Chill Movie")
      fill_in('movie[ticket_cost]', with: '12.00')
      choose('movie_is_rated_r_true')
      click_button('Update Movie')

      expect(current_path).to eq("/movies/#{movie_1.id}")
      expect(page).to have_content("The Big Chill")
      expect(page).to have_content("Movie Starts: #{date} #{display_time}")
      expect(page).to have_content("Duration: 120")
      expect(page).to have_content("Ticket Cost: $12.00")
      expect(page).to have_content("Rated R: Yes")
      expect(page).to have_content("Auditorium: East 1")
    end

    it 'I can update only that movie but empty fields are not updated' do
      Auditorium.destroy_all
      Movie.destroy_all

      auditorium_1 = Auditorium.create!( name: "East 1",
                                        capacity: 100,
                                        is_imax_auditorium: true)
      movie_1 = auditorium_1.movies.create!( name: "The Big Lebowski",
                              showtime_date: "2021-02-12",
                              showtime_start: "13:00:00",
                              duration: 110,
                              ticket_cost: 10.00,
                              is_rated_r: true)
      visit "/movies"

      click_link("The Big Lebowski")
      click_link("Edit Movie")

      date = Date.today.strftime("%a %b %d %Y")
      time = Time.now.strftime("%H:%M:%S")
      display_time = Time.now.strftime("%I:%M %p")

      expect(current_path).to eq("/movies/#{movie_1.id}/edit")
      expect(page).to have_content("Editing The Big Lebowski Movie")
      fill_in('movie[name]', with: '')
      fill_in('movie[showtime_date]', with: '')
      fill_in('movie[showtime_start]', with: '')
      fill_in('movie[duration]', with: '')
      fill_in('movie[ticket_cost]', with: '')
      click_button('Update Movie')

      expect(current_path).to eq("/movies/#{movie_1.id}")
      expect(page).to have_content("The Big Lebowski")
      expect(page).to have_content("Movie Starts: Fri Feb 12 2021 01:00 PM")
      expect(page).to have_content("Duration: 110")
      expect(page).to have_content("Ticket Cost: $10.00")
      expect(page).to have_content("Auditorium: East 1")

      visit "/movies"

      click_link("The Big Lebowski")
      click_link("Edit Movie")

      expect(current_path).to eq("/movies/#{movie_1.id}/edit")
      fill_in('movie[name]', with: '')
      fill_in('movie[ticket_cost]', with: '12.00')
      choose('movie_is_rated_r_true')
      click_button('Update Movie')

      expect(current_path).to eq("/movies/#{movie_1.id}")
      expect(page).to have_content("The Big Lebowski")
      expect(page).to have_content("Ticket Cost: $12.00")
      expect(page).to have_content("Rated R: Yes")
    end
  end
end
