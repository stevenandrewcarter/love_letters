class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.references :user, index: true
      t.references :message, index: true

      t.timestamps
    end
  end
end
