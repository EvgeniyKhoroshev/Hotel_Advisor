class UsersController < ApplicationController

  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :show_users_by_admin, only: :index
  before_action :users_not_signup, only: [:new, :create]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page], :per_page => 10)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id]);
    @user_hotels = @user.hotel.to_a.paginate(page: params[:page], :per_page => 7)
  end

  def create
    @user = User.new permitted_params
    if @user.save
      sign_in @user
      flash.now[:success] = 'Registration complete!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @user.update permitted_params
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @users = User.paginate(page: params[:page], :per_page => 10)
    user = User.find(params[:id])
    if user.admin?
      flash[:error] = "Administrator can't delete himself"
    else
      user.destroy
    end
    redirect_to users_path
  end

  private
  def permitted_params
      params.require(:user).permit(:name, :surname, :email, :photo, :password, :password_confirmation)
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: 'Please sign in.'
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end

  def show_users_by_admin
    if !current_user.admin?
      redirect_to root_path
    end
  end

  def users_not_signup
    if signed_in?
      redirect_to root_path
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
