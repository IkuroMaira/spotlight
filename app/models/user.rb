class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  # Relations
  has_many :spots, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :visit_statuses, dependent: :destroy

  # Validations
  validates :email_address, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :username, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :password, length: { minimum: 6, maximum: 72 }, if: :password_required?

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  private

  def password_required?
    new_record? || password.present?
  end
end
