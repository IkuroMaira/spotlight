class UsersController < ApplicationController
  # Permet d'éviter de répérer : "@user = User.find(params[:id])" dans show, edit et update
  before_action :set_user, only: %i[ show edit update destroy ]

  # Pour Afficher tous les utilisateurs
  def index
    @users = User.all
  end

  # Pour montrer un user selon son ID
  def show
  end

  # Pour instancier un nouvel utilisateur avec un formulaire => affiche une page avec un formulaire
  def new
    @user = User.new
  end

  # Créer un nouvel utilisateur
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Aller à la page pour mofifier un utilisateur
  def edit
  end

  # Mettre à jour un utilisateur
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
    redirect_to users_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email_address, :password, :password_confirmation)
  end
end
