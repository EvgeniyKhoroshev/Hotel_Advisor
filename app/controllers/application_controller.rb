class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include Admin::HotelsHelper
  include HotelsHelper
  include PostsHelper
end
