# frozen_string_literal: true

module ReviewServices
  class Create
    attr_reader :spot, :user, :rating, :comment, :review

    def initialize(spot:, user:, rating:, comment:)
      @spot = spot
      @user = user
      @rating = rating
      @comment = comment
    end

    def perform
      create_review!              # Étape 1 : créer la review avec les ENTRÉES
      update_spot_average_rating! # Étape 2 : met à jour la moyenne
      review                      # Étape 3 : RETOURNE la review créée
    end

    private

    def create_review!
      @review = Review.create!(
        spot: spot,
        user: user,
        rating: rating,
        comment: comment
      )
    end

    def update_spot_average_rating!
      average = spot.reviews.average(:rating).to_f.round(2)
      spot.update!(average_rating: average)
    end
  end
end
