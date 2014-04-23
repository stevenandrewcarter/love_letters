class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :name
      t.datetime :date

      t.timestamps
    end
  end
end
