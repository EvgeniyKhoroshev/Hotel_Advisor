module Admin::HotelsHelper
  def find_user_by_id(id)
    User.find_by_id(id)
  end
end