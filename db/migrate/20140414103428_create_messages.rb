class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.string :body
      t.integer :sender_id, index: true
      t.integer :recipient_id, index: true

      t.timestamps
    end
  end
end
