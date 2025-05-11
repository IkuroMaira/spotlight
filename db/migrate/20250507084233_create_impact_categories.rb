class CreateImpactCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :impact_categories do |t|
      t.string :name, limit: 50
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :impact_categories, [:name, :user_id], unique: true
  end
end
