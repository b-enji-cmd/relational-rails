class MoveStartDateToAfterName < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :showtime_date, :date, after: :name
  end
end
