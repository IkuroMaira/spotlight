class Tag < ApplicationRecord
  has_and_belongs_to_many :spots

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
end
