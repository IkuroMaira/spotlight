class Video < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  enum video_type: {
    upload: 'upload',
    youtube: 'youtube',
    vimeo: 'vimeo',
    url: 'url'
  }

  validates :title, presence: true, length: { maximum: 255 }
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
  validates :video_type, presence: true
  validates :duration_seconds, presence: true, numericality: { greater_than: 0 }, if: :upload?
  validates :file_size_bytes, numericality: { greater_than: 0 }, if: :upload?
  validates :mime_type, presence: true, if: :upload?

  scope :featured, -> { where(is_featured: true) }
  scope :active, -> { where(is_active: true) }
  scope :recent, -> { order(created_at: :desc) }

  before_save :extract_video_info, if: :url_changed?

  def increment_views!
    increment!(:views_count)
  end

  def duration_formatted
    return nil unless duration_seconds
    
    minutes = duration_seconds / 60
    seconds = duration_seconds % 60
    "#{minutes}:#{seconds.to_s.rjust(2, '0')}"
  end

  private

  def extract_video_info
    case video_type
    when 'youtube'
      extract_youtube_info
    when 'vimeo'
      extract_vimeo_info
    end
  end

  def extract_youtube_info
    if url.match(/(?:youtube\.com\/watch\?v=|youtu\.be\/)([^&\n?#]+)/)
      youtube_id = $1
      self.thumbnail_url = "https://img.youtube.com/vi/#{youtube_id}/maxresdefault.jpg"
    end
  end

  def extract_vimeo_info
    if url.match(/vimeo\.com\/(\d+)/)
      # Vimeo thumbnail extraction would require API call
      # For now, just set a placeholder
      self.thumbnail_url = nil
    end
  end
end