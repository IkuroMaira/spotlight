class User < ApplicationRecord
  # TODO: ajouter une validation au niveau du modèle, complémentaire avec la contrainte en base de données
  validates :pseudo, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :password, presence: true, length: { minimum: 6, maximum: 72 }

  # Callbacks - s'éxécutent à certains moment du cycle de vie
  before_create :check_password_length

  private

  def check_password_length
    if password.length < self.password.length
      self.errors.add(:password, "Le mot de passe est trop court (minimum 6 caractères)")
      throw :abort # Empêche l'enregistrement
    end
  end
end
