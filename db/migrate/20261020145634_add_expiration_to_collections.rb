class AddExpirationToCollections < ActiveRecord::Migration[8.0]
  def change
    add_column :collections, :expires_at, :datetime
    add_index :collections, :expires_at
    add_column :collections, :expiration_reminder_sent_at, :datetime
  end
end
