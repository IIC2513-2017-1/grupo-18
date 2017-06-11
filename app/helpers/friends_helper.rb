module FriendsHelper

  def different_user?
  	current_user.id != @user.id 
  end

  def who_added_me(user)
    User.where(id: Friend.where(friend:user).pluck(:user_id))
  end

  # Amistad biyectiva
  def real_friends(user)
    User.where(id: Friend.where(user_id: Friend.where(user_id: user.id).pluck(:friend_id), friend_id: user.id).pluck(:user_id))
  end


  def friends?
  	Friend.find_by(user_id: current_user.id, friend_id: @user.id)
  	#Friend.find_by(user_id: current_user.id) && Friend.find_by(user_id: current_user.id, friend_id: @user.id).friend_id==@user.id
  end

  def our_friendship
  	Friend.find_by(user_id: current_user.id, friend_id: @user.id)
  end

  def only_I_am_friend?(user, friend)
    usr_to_friend(user, friend) && !usr_to_friend(friend, user)
  end

  def only_he_is_friend?(user, friend)
    !usr_to_friend(user, friend) && usr_to_friend(friend, user)
  end

  def are_we_both_friends?(user, friend)
    usr_to_friend(user, friend) && usr_to_friend(friend, user)
  end

  private
    def usr_to_friend(user, friend)
      Friend.find_by(user: user, friend: friend)
    end
end
