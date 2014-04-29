class CreateSentMessages < ActiveRecord::Migration
  def change
    create_table :sent_messages do |t|
      t.integer :sender_id, index: true
      t.integer :recipient_id, index: true
      t.references :message, index: true

      t.timestamps
    end
    add_index :sent_messages, :sender_id
    add_index :sent_messages, :recipient_id
  end
end
