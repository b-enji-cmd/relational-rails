class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.time :showtime_start
      t.integer :duration
      t.float :ticket_cost
      t.boolean :is_rated_r

      t.timestamps
    end
  end
end
