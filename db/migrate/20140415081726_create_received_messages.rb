class CreateReceivedMessages < ActiveRecord::Migration
  def change
    create_table :received_messages do |t|
      t.integer :sender_id, index: true
      t.integer :recipient_id, index: true
      t.boolean :read, default: false
      t.datetime :date_read
      t.references :message, index: true

      t.timestamps
    end
    add_index :received_messages, :sender_id
    add_index :received_messages, :recipient_id
  end
end
