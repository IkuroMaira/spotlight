class CreateVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.text :description
      t.string :url, null: false
      t.string :video_type, null: false, default: 'upload' # 'upload', 'youtube', 'vimeo', 'url'
      t.string :thumbnail_url
      t.integer :duration_seconds
      t.integer :file_size_bytes
      t.string :mime_type
      t.references :user, null: false, foreign_key: true
      t.references :spot, null: false, foreign_key: true
      t.boolean :is_featured, default: false
      t.boolean :is_active, default: true
      t.integer :views_count, default: 0
      t.timestamps
    end

    add_index :videos, [:spot_id, :is_featured]
    add_index :videos, [:user_id, :created_at]
    add_index :videos, :video_type
  end
end
