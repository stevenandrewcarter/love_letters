class AlterUserAddAdministrator < ActiveRecord::Migration
  def change
    change_table(:users) { |t| t.column :is_administrator, :boolean }
  end
end
