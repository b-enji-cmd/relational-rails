class ChangeMoviesIsRatedRDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:movies, :is_rated_r, 'new')
    change_column_default(:movies, :is_rated_r, false)
  end
end
