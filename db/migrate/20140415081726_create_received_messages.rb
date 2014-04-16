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
  end
end
