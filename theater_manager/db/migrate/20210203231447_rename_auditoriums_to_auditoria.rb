class RenameAuditoriumsToAuditoria < ActiveRecord::Migration[5.2]
  def change
    rename_table :auditoriums, :auditoria
  end
end
