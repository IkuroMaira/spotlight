class SpotsController < ApplicationController
  before_action :require_authentication, except: [:index, :show]

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

  def destroy
    @spot.destroy
    redirect_to spots_path
  end

  private
  def set_spot
    @spot = User.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:name, :address)
  end
end
