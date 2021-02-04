class CreateTheaters < ActiveRecord::Migration[5.2]
  def change
    create_table :theaters do |t|
      t.string :name
      t.boolean :is_open
      t.string :location
      t.integer :capacity

      t.timestamps
    end
  end
end
