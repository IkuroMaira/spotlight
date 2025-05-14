class CreateCollections < ActiveRecord::Migration[8.0]
  def change
    create_table :collections do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.boolean :is_public

      t.timestamps
    end
  end
end
