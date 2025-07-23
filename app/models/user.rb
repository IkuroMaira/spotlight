class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  # Relations
  has_many :spots, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :visit_statuses, dependent: :destroy
  has_many :events, dependent: destroy

  # Validations
  validates :email_address, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :username, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :password, length: { minimum: 6, maximum: 72 }, if: :password_required?

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  after_create_commit :send_welcome_email_async

  private

  def password_required?
    new_record? || password.present?
  end

  def send_welcome_email_async
    UserMailer.welcome_email(self).deliver_later
  end
end
