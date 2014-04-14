class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.string :body
      t.references :mailbox, index: true

      t.timestamps
    end
  end
end
