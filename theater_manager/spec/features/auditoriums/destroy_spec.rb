require 'rails_helper'

RSpec.describe 'When I visit auditorium index', type: :feature do
  describe 'and I select a link to one auditorium' do
    it 'I can delete it' do
      Auditorium.destroy_all

      auditorium_1 = Auditorium.create( name: "East 1",
                                        capacity: 100,
                                        is_imax_auditorium: true)
      visit "/auditoriums"
      click_link("East 1")

      expect(current_path).to eq("/auditoriums/#{auditorium_1.id}")

      click_link("Delete Auditorium")

      expect(current_path).to eq("/auditoriums")
      expect(page).not_to have_content("East 1")
    end

    describe 'and that auditorium has movies,' do
      it 'I can delete that auditorium and all associated movies'  do
        Auditorium.destroy_all

        auditorium_1 = Auditorium.create( name: "East 1",
                                          capacity: 100,
                                          is_imax_auditorium: true)
        movie_1 = auditorium_1.movies.create!( name: "The Big Lebowski",
                                showtime_date: "2021-02-12",
                                showtime_start: "13:00:00",
                                duration: 110,
                                ticket_cost: 10.00,
                                is_rated_r: true)

        visit "/auditoriums"
        click_link("East 1")

        expect(current_path).to eq("/auditoriums/#{auditorium_1.id}")

        click_link("auditorium_movie_index")

        expect(current_path).to eq("/auditoriums/#{auditorium_1.id}/movies")
        expect(page).to have_content("The Big Lebowski")

        click_link 'Auditorium Index'
        click_link "East 1"
        click_link "Delete Auditorium"

        expect(current_path).to eq("/auditoriums")
        expect(page).not_to have_content("East 1")

        visit "/movies"

        expect(page).not_to have_content("The Big Lebowski")
      end
    end
  end
end
