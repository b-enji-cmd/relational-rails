class CreateAuditoriums < ActiveRecord::Migration[5.2]
  def change
    create_table :auditoriums do |t|
      t.string :name
      t.integer :capacity
      t.boolean :is_imax_theater?

      t.timestamps
    end
  end
end
