class CreateSpots < ActiveRecord::Migration[8.0]
  def change
    create_table :spots do |t|
      t.string :name, limit: 50
      t.float :longitude
      t.float :latitude
      t.integer :impact_category

      t.timestamps
    end
  end
end
