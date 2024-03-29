module UsersHelper
include SessionsHelper

  def admin_access?
  	logged_in? && current_user.user_type != 0
  end

  def user_type_string
  	admin_access? && t('header.admin_user') || t('header.normal_user')
  end

  def see_this_userS_type
    @user.user_type != 0 && t('header.admin_user') || t('header.normal_user')
  end

  def user_name
  	current_user.username
  end

  def private_view_access?
  	!different_user? || friends? || admin_access?
  end
end
