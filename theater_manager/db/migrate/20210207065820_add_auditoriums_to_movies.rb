class AddAuditoriumsToMovies < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :auditorium, foreign_key: true
  end
end
