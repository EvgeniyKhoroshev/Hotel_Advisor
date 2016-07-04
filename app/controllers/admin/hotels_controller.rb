class Admin::HotelsController < ApplicationController

  before_action :signed_in_admin, only: :index

  def index
    @hotels = Hotel.paginate(page: params[:page], :per_page => 10)
  end

  def destroy
    hotel = Hotel.find(params[:id]).destroy
    redirect_to admin_hotels_path
  end

  private

    def signed_in_admin
      if signed_in?
        if !current_user.admin?
          redirect_to root_path
        end
      else
        redirect_to signin_path
      end
    end

end