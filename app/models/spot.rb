class Spot < ApplicationRecord
  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :visit_statuses, dependent: :destroy
  has_many :events, dependent: :destroy

  # Association pour les relations many-to-many
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :collections

  validates :name, presence: { message: "Ne peut pas être vide" },
                   length: { in: 2..100 },
                   uniqueness: { scope: :user_id, message: "Vous avez déjà un spot avec ce nom" }
  validates :description, length: { maximum: 1000 }
  validates :description, presence: true, if: :social_impact?
  validates :address, presence: true, length: { maximum: 255 }
  validates :latitude, presence: true, numericality: {
    greater_than_or_equal_to: -90,
    less_than_or_equal_to: 90
  }
  validates :longitude, presence: true, numericality: {
    greater_than_or_equal_to: -180,
    less_than_or_equal_to: 180
  }

  private
  def social_impact?
    is_social_impact
  end
end
