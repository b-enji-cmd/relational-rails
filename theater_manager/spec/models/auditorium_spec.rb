require 'rails_helper'

RSpec.describe Auditorium, type: :model do
  describe 'relationships' do
    it { should have_many :movies }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:capacity) }
  end

  describe 'class methods' do
    it '::ordered_by_created_at'do
      auditorium_1 = Auditorium.create( name: "North 1",
                                        capacity: 50,
                                        is_imax_auditorium: true)

      auditorium_2 = Auditorium.create( name: "North 2",
                                        capacity: 100,
                                        is_imax_auditorium: true)

      expect(Auditorium.order_created_at_desc.first).to eq(auditorium_2)
    end
  end

  describe 'instance methods' do

    it'#movie_count' do
      auditorium_1 = Auditorium.create( name: "North 1",
                                        capacity: 50,
                                        is_imax_auditorium: true)
      auditorium_2 = Auditorium.create!( name: "North 2",
                                          capacity: 100,
                                          is_imax_auditorium: true)

      movie_1 = auditorium_1.movies.create!( name: "MOVIE_A",
                                              showtime_date: "2021-02-12",
                                              showtime_start: "13:00:00",
                                              duration: 110,
                                              ticket_cost: 10.00,
                                              is_rated_r: true)
      expect(auditorium_1.movie_count).to eq(1)
      expect(auditorium_2.movie_count).to eq(0)

    end

    it '#filtered_by_cost' do
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

      expect(auditorium_1.filtered_by_cost(11).length).to eq(1)
      expect(auditorium_1.filtered_by_cost(100).length).to eq(0)
    end

    it '#sort_by_name'do
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
        movie_4 = auditorium_2.movies.create!( name: "MOVIE_D",
                                              showtime_date: "2021-02-12",
                                              showtime_start: "16:00:00",
                                              duration: 108,
                                              ticket_cost: 12.00,
                                              is_rated_r: false)

        expect(auditorium_1.sort_by_name.first).to eq(movie_2)
        expect(auditorium_1.sort_by_name.last).to eq(movie_3)

    end
  end
end
