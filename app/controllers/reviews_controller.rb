class ReviewsController < ApplicationController
  def create
    ReviewServices::Create.new(
      spot: @spot,
      user: Current.user,
      rating: params[:rating],
      comment: params[:comment]
    ).perform

    redirect_to @spot, notice: "Review créée !"
  end
end
