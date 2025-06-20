class CreateJoinTableCollectionsAndSpots < ActiveRecord::Migration[8.0]
  def change
    create_join_table :collections, :spots do |t|
      t.index [:collection_id, :spot_id]
      t.index [:spot_id, :collection_id]

      t.timestamps
    end
  end
end
