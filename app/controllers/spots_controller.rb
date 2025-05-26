class SpotsController < ApplicationController
  before_action :require_authentication, except: [:index]
  before_action :set_spot, only: %i[ show edit update destroy ]

  def index
    @mapbox_token = ENV["MAPBOX_ACCESS_TOKEN"]

    if authenticated?
      @spots = Current.user.spots.order(created_at: :desc)
    else
      @spots = Spot.none
    end
  end

  def show
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = Current.user

    if @spot.save
      redirect_to spots_path, notice: "Votre spot a été ajouté !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @spot.update(spot_params)
      redirect_to @spot, notice: "Votre spot a été mis à jour !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @spot.destroy
      redirect_to spots_path, notice: "Votre spot a été supprimé !"
    else
      redirect_to spots_path, alert: "Une erreur est survenue !"
    end
  end

  private

  def set_spot
    @spot = Current.user.spots.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to spots_path, alert: "Ce spot n'existe pas ou ne vous appartient pas."
  end

  def spot_params # = strong param, une façon de protéger l'app
    params.require(:spot).permit(:name, :address, :is_social_impact, :description)
  end
end
