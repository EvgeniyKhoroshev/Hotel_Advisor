class SessionsController < ApplicationController

  before_action :users_not_signin, only: :new
  def new

  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

    def users_not_signin
      if signed_in?
        redirect_to root_path
      end
    end

end
