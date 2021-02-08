class ChangeAuditoriaIsImaxAuditoriumColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:auditoria, :is_imax_auditorium, 'new')
    change_column_default(:auditoria, :is_imax_auditorium, false)
  end
end
