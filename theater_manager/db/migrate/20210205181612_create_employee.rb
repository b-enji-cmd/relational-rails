class CreateEmployee < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.boolean :is_full_time
      t.integer :hours_worked

      t.timestamps
    end
  end
end
