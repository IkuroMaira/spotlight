class IcsGenerator
  def initialize(event)
    @event = event
  end

  def generate
    calendar = Icalendar::Calendar.new
    calendar.event do |e|
      # Propriétés obligatoires
      e.dtstart = @event.start_time
      e.dtend = @event.end_time
      e.summary = @event.title
      # Aujouter d'autres propriétés
    end

    # La méthode .to_ical génère le texte au format ICS standard
    calendar.to_ical
  end
end
