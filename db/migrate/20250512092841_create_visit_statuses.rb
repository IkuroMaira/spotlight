class CreateVisitStatuses < ActiveRecord::Migration[8.0]
  def change
    create_table :visit_statuses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :spot, null: false, foreign_key: true
      t.string :status
      t.datetime :visited_at

      t.timestamps
    end
  end
end
