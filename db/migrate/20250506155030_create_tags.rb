class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags do |t|
      t.string :name, limit: 50
      t.string :color, limit: 50

      t.timestamps
    end
  end
end
