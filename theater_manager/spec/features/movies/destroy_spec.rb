require 'rails_helper'

RSpec.describe 'When I visit movie index', type: :feature do
  it 'and I select a link to one movie I can delete it' do
    Movie.destroy_all

    auditorium_1 = Auditorium.create( name: "East 1",
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

    expect(current_path).to eq("/movies/#{movie_1.id}")

    click_link("Delete Movie")

    expect(current_path).to eq("/movies")
    expect(page).not_to have_content("The Big Lebowski")
  end
end
