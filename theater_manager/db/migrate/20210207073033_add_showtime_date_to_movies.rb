class AddShowtimeDateToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :showtime_date, :date
  end
end
