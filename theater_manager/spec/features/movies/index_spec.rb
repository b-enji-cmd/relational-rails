equire 'rails_helper'

RSpec.describe 'When I visit movies index page', type: :feature do

  it 'it displays all movies and all data for each' do
    auditorium_1 = Auditorium.create( name: "North 1",
                                      :capacity: 50,
                                      is_imax_auditorium: true)

    auditorium_2 = Auditorium.create( name: "North 2",
                                      capacity: 100,
                                      is_imax_auditorium: true)
    movie_1 = Movie.create( name: "The Big Lebowski",
                            showtime_start: 2021-02-10 13:00:00,
                            duration: 110,
                            ticket_cost: 10.00,
                            is_rated_r: true,
                          )

    visit '/movies'

    expect(page).to have_content(movie_1.name)
  end
end
