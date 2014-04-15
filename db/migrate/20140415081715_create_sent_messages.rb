class CreateSentMessages < ActiveRecord::Migration
  def change
    create_table :sent_messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.references :message, index: true

      t.timestamps
    end
  end
end
