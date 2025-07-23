class Review < ApplicationRecord
  belongs_to :spot
  belongs_to :user

  validates :rating, presence: false, inclusion: { in: 1..5 }
  validates :spot, presence: true
  validates :user, presence: true
end
