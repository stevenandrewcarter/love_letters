class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :workshop_name
      t.datetime :workshop_date

      t.timestamps
    end
  end
end
