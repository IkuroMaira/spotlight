class CreateSpots < ActiveRecord::Migration[8.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude
      t.string :address
      t.references :user, null: false, foreign_key: true
      t.boolean :is_social_impact

      t.timestamps
    end
  end
end