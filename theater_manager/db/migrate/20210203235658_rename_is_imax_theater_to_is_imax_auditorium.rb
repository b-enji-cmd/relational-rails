class RenameIsImaxTheaterToIsImaxAuditorium < ActiveRecord::Migration[5.2]
  def change
    rename_column :auditoria, :is_imax_theater?, :is_imax_auditorium
  end
end
