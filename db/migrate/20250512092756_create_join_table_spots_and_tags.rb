class CreateJoinTableSpotsAndTags < ActiveRecord::Migration[8.0]
  def change
    create_join_table :spots, :tags do |t|
      t.index [:spot_id, :tag_id]
      t.index [:tag_id, :spot_id]

      t.timestamps
    end
  end
end
