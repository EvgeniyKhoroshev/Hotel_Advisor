class Api::V1::SessionsController < ApplicationController

  before_action :users_not_signin, only: :new

  def new

  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      render json: user, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out
    render nothing, status: :ok
  end

  private

    def users_not_signin
      if signed_in?
        render nothing, status: :unprocessable_entity
      end
    end

end
