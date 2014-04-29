class AlterEventsAddCountryCode < ActiveRecord::Migration
  def change
    change_table(:events) do |t|
      t.column :country_code, :string
      t.column :state_code, :string
    end
  end
end
