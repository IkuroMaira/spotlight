class Photo < ApplicationRecord
  belongs_to :spot
  belongs_to :user

  validates :spot, presence: true
  validates :user, presence: true
end
