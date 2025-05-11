class CreateUsersSpots < ActiveRecord::Migration[8.0]
  def change
    create_table :users_spots do |t|
      t.references :spot, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :users_spots, [:spot_id, :user_id], unique: true
  end
end
