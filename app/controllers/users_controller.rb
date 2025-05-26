class UsersController < ApplicationController
  # Permet d'éviter de répéter : "@user = User.find(params[:id])" dans show, edit et update
  before_action :set_user, only: %i[ show edit update destroy ]

  # Pour montrer un user selon son ID
  def show
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(user_params)
      redirect_to @user, notice: "Votre profil a été mis à jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    # Aller voir requête sous un format
    redirect_to users_path, notice: "L'utilisateur a été supprimé !"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email_address, :password, :password_confirmation)
  end
end