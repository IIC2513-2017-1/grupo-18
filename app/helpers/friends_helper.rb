module FriendsHelper
  def friends?
  	Friend.find_by(user_id: current_user.id) && Friend.find_by(user_id: current_user.id).friend_id==@user.id
  end

  def our_friendship
  	Friend.find_by(user_id: current_user.id, friend_id: @user.id)
  end
end
