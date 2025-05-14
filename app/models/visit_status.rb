class VisitStatus < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :status, presence: true, inclusion: { in: ['to_visit', 'visited'] }
  validates :user, presence: true
  validates :spot, presence: true
end
