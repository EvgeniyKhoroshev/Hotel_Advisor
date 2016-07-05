class Api::V1::UsersController < ApplicationController

  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :users_not_signup, only: [:new, :create]
  before_action :signed_in_admin, only: [:index, :destroy]

  def index
    users = User.all
    render json: users, status: :ok
  end

  def new
    user = User.new
  end

  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  end

  def create
    user = User.new permitted_params
    if user.save
      sign_in user
      render json: user, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if user.update permitted_params
      render nothing, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    if user.admin?
      render nothing, status: :unprocessable_entity
    else
      user.destroy
      render nothing, status: :ok
    end
  end

  private

  def permitted_params
      params.require(:showhotels).permit(:name, :surname, :email, :photo, :password, :password_confirmation)
  end

  def signed_in_user
    unless signed_in?
      render nothing, status: :unprocessable_entity
    end
  end

  def correct_user
    @user = User.find(params[:id])
    render nothing, status: :unprocessable_entity unless current_user?(@user)
  end

  def users_not_signup
    if signed_in?
      redirect_to root_path
    end
  end

  def signed_in_admin
    redirect_to root_path unless current_user.admin?
  end

end
