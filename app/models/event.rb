class Event < ApplicationRecord
  belongs_to :spot
  belongs_to :user

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    return unless start_time && end_time

    if end_time <= start_time
      errors.add(:end_time, "doit être après l'heure de début")
    end
  end
end
