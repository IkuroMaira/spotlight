class EventsController < ApplicationController
  allow_unauthenticated_access

  # before_action :set_spot
  # before_action :set_event, only: [:show, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    # On créé l'évènement à partir du formulaire
    # On dit que c'est l'utilisateur connecté qui le créé
    # On sauvegarde en base de données
    # Et si ça marche on envoie un mail
    # On affiche un message de succès après avoir rédirigé
    # Prévoir le cas où ça ne marche pas
  end

  # Afficher l'évènement
  #
  # Méthode pour récupérer le spot depuis l'URL
  # Méthode pour récupérer l'événement
end
