class AlterProfileAddLocation < ActiveRecord::Migration
  def change
    change_table(:profiles) do |t|
      t.column :country_code, :string
      t.column :state_code, :string
    end
  end
end
