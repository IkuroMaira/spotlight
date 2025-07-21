class UserMailer < ApplicationMailer
  default from: "notifications@spotlight.com"

  def welcome_email(user_id)
    @user = User.find(user_id)
    @login_url = root_url

    mail(to: @user.email_address, subject: "Welcome to Spotlight")
  end

  # Mail de rappel pour les spots à visiter
=begin
  def spots_reminder_email(user, spots_to_visit)
    @user = user
    @spots = spots_to_visit
    @app_url = root_url

    mail(
      to: @user.email,
      subject: "Vous avez #{@spots.count} spots à découvrir ! ✨"
    )
  end
=end
end
