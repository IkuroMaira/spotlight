class AddAverageRatingToSpots < ActiveRecord::Migration[8.0]
  def change
    add_column :spots, :average_rating, :decimal, precision: 3, scale: 2, default: 0.0
  end
end
