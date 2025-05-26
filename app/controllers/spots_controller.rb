class SpotsController < ApplicationController
  before_action :require_authentication, except: [:index]
  before_action :set_spot, only: %i[ show edit update destroy ]

  def index
    @mapbox_token = ENV["MAPBOX_ACCESS_TOKEN"]
    @spots = Spot.all
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
  end

  def destroy
    @spot.destroy
    redirect_to spots_path, notice: "Votre spot a été supprimé !"
  end

  private
  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params # = strong param, une façon de protéger l'app
    params.require(:spot).permit(:name, :address, :is_social_impact, :description)
  end
end
