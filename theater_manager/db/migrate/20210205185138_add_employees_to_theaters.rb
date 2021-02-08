class AddEmployeesToTheaters < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :theater, foreign_key: true
  end
end
