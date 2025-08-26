class EventMailer < ApplicationMailer
  def event_invitation(event, recipient_email)
    @event = event
    @recipient_email = recipient_email || event.user.email

    # On génère le contenu du fichier ICS
    ics_content = IcsGenerator.new(event).generate

    # On attache le fichier ICS à l'email
    attachments["#{@event.title}.ics"] = {
      mime_type: 'text/calendar',  # On dit que c'est un fichier calendrier
      content: ics_content         # Le contenu du fichier
    }

    # On envoie le mail
    mail(
      to: recipient_email,
      subject: "Invitation : #{@event.title}"
    )
  end
end
