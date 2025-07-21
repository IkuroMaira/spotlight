class ApplicationMailer < ActionMailer::Base
  default from: "noreply@spotlight.com"
  layout "mailer"

  private

  # Méthode helper pour personnaliser les signatures
  def app_signature
    "L'équipe SpotLight 🌟"
  end
end
