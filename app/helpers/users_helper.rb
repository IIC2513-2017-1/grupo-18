module UsersHelper
include SessionsHelper

  def admin_access?
  	logged_in? && current_user.user_type != 0
  end

  def user_type_string
  	admin_access? && 'Admin user' || 'Normal user'
  end
end
