class CreateSpotsTags < ActiveRecord::Migration[8.0]
  def change
    create_table :spots_tags do |t|
      t.references :spot, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end

    add_index :spots_tags, [:spot_id, :tag_id], unique: true
  end
end
