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

        click_link("Movies")
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

      # it 'I can create a new auditorium' do
      #   visit "/auditoriums"
      #   click_link("New Auditorium")
      #
      #   expect(current_path).to eq("/auditoriums/new")
      #
      #   fill_in('auditorium[name]', with: 'South 1')
      #   fill_in('auditorium[capacity]', with: '100')
      #   choose('true')
      #   click_button('Create Auditorium')
      #
      #   expect(page).to have_content('South 1')
      # end

      # it 'I cannot create new auditorium when name or capacity are empty' do
      #   visit "/auditoriums"
      #   click_link("New Auditorium")
      #
      #   expect(current_path).to eq("/auditoriums/new")
      #
      #   choose('true')
      #   click_button('Create Auditorium')
      #
      #   expect(page).to have_content("Auditorium not created: Required information missing.")
      #   expect(page).to have_button('Create Auditorium')
      #
      #   fill_in('auditorium[capacity]', with: '100')
      #   choose('true')
      #   click_button('Create Auditorium')
      #
      #   expect(page).to have_content("Auditorium not created: Required information missing.")
      #   expect(page).to have_button('Create Auditorium')
      #
      #   fill_in('auditorium[name]', with: 'South 2')
      #   choose('true')
      #   click_button('Create Auditorium')
      #
      #   expect(page).to have_content("Auditorium not created: Required information missing.")
      #   expect(page).to have_button('Create Auditorium')
      # end

      # it 'I can create auditorium when IMAX Auditorium radio is not selected' do
      #   visit '/auditoriums/new'
      #
      #   fill_in('auditorium[name]', with: 'South 2')
      #   fill_in('auditorium[capacity]', with: '25')
      #   click_button('Create Auditorium')
      #
      #   expect(page).to have_content('South 2')
      #   click_link("South 2")
      #
      #   expect(page).to have_content('IMAX Auditorium: No')
      # end
    end
  end
end
