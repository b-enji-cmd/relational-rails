Theater.destroy_all
Employee.destroy_all
Auditorium.destroy_all
Movie.destroy_all


theater_1 = Theater.create(name: 'Harkins',
                          is_open: true,
                          location: 'Denver',
                          capacity: 200)

theater_2 = Theater.create(name: 'United',
                          is_open: true,
                          location: 'Denver',
                          capacity: 300)

auditorium_1 = Auditorium.create( name: "North",
                                  capacity: 50,
                                  is_imax_auditorium: true)

auditorium_2 = Auditorium.create( name: "South",
                                  capacity: 100,
                                  is_imax_auditorium: true)

employee_1 = theater_1.employees.create(name: 'Mark',
                                        is_full_time: true,
                                        hours_worked: 90)

employee_2 = theater_1.employees.create(name: 'Greg',
                                        is_full_time: true,
                                        hours_worked: 50)

employee_3 = theater_2.employees.create(name: 'Frodo',
                                        is_full_time: false,
                                        hours_worked: 15)

employee_4 = theater_2.employees.create(name: 'Sam Wise',
                                        is_full_time: true,
                                        hours_worked: 100)

movie_1 = auditorium_1.movies.create!( name: "The Big Lebowski",
                        showtime_date: "2021-02-12",
                        showtime_start: "13:00:00",
                        duration: 110,
                        ticket_cost: 10.00,
                        is_rated_r: true)

movie_2 = auditorium_1.movies.create!( name: "The Rugrats",
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
                        is_rated_r: true)

movie_4 = auditorium_2.movies.create!( name: "Spaceballs",
                        showtime_date: "2021-02-14",
                        showtime_start: "16:00:00",
                        duration: 108,
                        ticket_cost: 15.00,
                        is_rated_r: false)
