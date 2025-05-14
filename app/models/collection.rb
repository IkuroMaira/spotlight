class Collection < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :spots

  validates :name, presence: true
  validates :user, presence: true
end
