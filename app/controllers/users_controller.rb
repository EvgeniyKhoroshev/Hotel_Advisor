class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id]);
  end

  def create
    @user = User.new permitted_params
    if @user.save
      sign_in @user
      flash[:success] = 'Registration complete!'
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  def permitted_params
      params.require(:user).permit(:name, :surname, :email, :photo, :password, :password_confirmation)
  end
end
