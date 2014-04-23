class AlterProfileAddBasicInformation < ActiveRecord::Migration
  def change
    change_table(:profiles) do |t|
      t.column :complete, :float, default: 0
      t.column :gender, :string
      t.column :date_of_birth, :date
    end
  end
end
