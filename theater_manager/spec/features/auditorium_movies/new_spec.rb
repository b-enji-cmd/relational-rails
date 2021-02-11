require 'rails_helper'

RSpec.describe 'When I visit auditoriums index', type: :feature do
  describe 'and select one auditorium' do
    describe 'and select movies' do
      it 'I can add a new movie associated to the current auditorium' do
        auditorium_1 = Auditorium.create( name: "East 1",
                                          capacity: 100,
                                          is_imax_auditorium: true)

        visit "/auditoriums"
        click_link("East 1")

        click_link("auditorium_movie_index")
        click_link("New Movie")

        expect(current_path).to eq("/auditoriums/#{auditorium_1.id}/movies/new")
        expect(page).to have_content("Create a New Movie:")

        date = Date.today.strftime("%a %b %d %Y")
        time = Time.now.strftime("%H:%M:%S")
        display_time = Time.now.strftime("%I:%M %p")

        fill_in('movie[name]', with: 'The Big Lebowski')
        fill_in('movie[showtime_date]', with: date)
        fill_in('movie[showtime_start]', with: time)
        fill_in('movie[duration]', with: '110')
        fill_in('movie[ticket_cost]', with: '10.00')
        choose('true')
        click_button('Create Movie')

        expect(page).to have_content('The Big Lebowski')
        expect(page).to have_content('Auditorium: East 1')
      end

      it 'I cannot create new movie when any form fields are empty' do
        auditorium_1 = Auditorium.create( name: "East 1",
                                          capacity: 100,
                                          is_imax_auditorium: true)

        visit "/auditoriums"
        click_link("East 1")

        click_link("auditorium_movie_index")
        click_link("New Movie")

        expect(current_path).to eq("/auditoriums/#{auditorium_1.id}/movies/new")
        expect(page).to have_content("Create a New Movie:")

        click_button('Create Movie')

        expect(page).to have_content("Movie not created: Required information missing.")
        expect(page).to have_button('Create Movie')

        fill_in('movie[name]', with: 'The Big Lebowski')
        click_button('Create Movie')

        expect(page).to have_content("Movie not created: Required information missing.")
        expect(page).to have_button('Create Movie')

        date = Date.today.strftime("%a %b %d %Y")
        fill_in('movie[showtime_date]', with: date)
        click_button('Create Movie')

        expect(page).to have_content("Movie not created: Required information missing.")
        expect(page).to have_button('Create Movie')

        time = Time.now.strftime("%H:%M:%S")
        fill_in('movie[showtime_start]', with: time)
        click_button('Create Movie')

        expect(page).to have_content("Movie not created: Required information missing.")
        expect(page).to have_button('Create Movie')

        fill_in('movie[duration]', with: '110')
        click_button('Create Movie')

        expect(page).to have_content("Movie not created: Required information missing.")
        expect(page).to have_button('Create Movie')

        fill_in('movie[ticket_cost]', with: '10.00')
        choose('true')
        click_button('Create Movie')

        expect(page).to have_content("Movie not created: Required information missing.")
        expect(page).to have_button('Create Movie')
      end

      it 'I can create movie when Rated R radio is not selected' do
        auditorium_1 = Auditorium.create( name: "East 1",
                                          capacity: 100,
                                          is_imax_auditorium: true)

        visit "/auditoriums"
        click_link("East 1")

        click_link("auditorium_movie_index")
        click_link("New Movie")

        expect(current_path).to eq("/auditoriums/#{auditorium_1.id}/movies/new")
        expect(page).to have_content("Create a New Movie:")

        date = Date.today.strftime("%a %b %d %Y")
        time = Time.now.strftime("%H:%M:%S")
        display_time = Time.now.strftime("%I:%M %p")

        fill_in('movie[name]', with: 'The Big Lebowski')
        fill_in('movie[showtime_date]', with: date)
        fill_in('movie[showtime_start]', with: time)
        fill_in('movie[duration]', with: '110')
        fill_in('movie[ticket_cost]', with: '10.00')
        click_button('Create Movie')

        expect(page).to have_content('The Big Lebowski')
        expect(page).to have_content('Auditorium: East 1')
        expect(page).to have_content('Rated R: No')
      end
    end
  end
end
