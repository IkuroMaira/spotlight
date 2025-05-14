class Spot < ApplicationRecord
  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :visit_statuses, dependent: :destroy

  # Association pour les relation many-to-many
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :collections

  validates :name, presence: true
  # validates :latitude, presence: true
  # validates :longitude, presence: true
end
